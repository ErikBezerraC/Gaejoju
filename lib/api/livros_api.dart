import 'package:dio/dio.dart';
import '../domain/livros.dart';

class LivrosApi {
  final Dio dio = Dio();

  final String urlLivros =
      'https://raw.githubusercontent.com/EbookFoundation/free-programming-books/main/books/free-programming-books-pt_BR.md#c';

  final String urlOpenLibrary =
      'https://openlibrary.org/search.json';

  Future<List<Livros>> listarLivrosC() async {
    try {
      final resposta = await dio.get(urlLivros);

      final String conteudo = resposta.data.toString();

      final linhas = conteudo.split('\n');

      List<Livros> livros = [];

      bool dentroDaSecaoC = false;

      for (String linha in linhas) {
        linha = linha.trim();

        if (linha == '### C') {
          dentroDaSecaoC = true;
          continue;
        }

        if (dentroDaSecaoC && linha.startsWith('### ')) {
          break;
        }

        if (!dentroDaSecaoC) {
          continue;
        }

        if (!linha.startsWith('* [')) {
          continue;
        }

        if (!linha.contains('(PDF)')) {
          continue;
        }

        final inicioTitulo = linha.indexOf('[');
        final fimTitulo = linha.indexOf(']');

        if (inicioTitulo == -1 || fimTitulo == -1) {
          continue;
        }

        final titulo = linha.substring(
          inicioTitulo + 1,
          fimTitulo,
        );

        // ============================================
        // PEGA O LINK
        // ============================================

        final inicioUrl = linha.indexOf(
          '(',
          fimTitulo,
        );

        final fimUrl = linha.indexOf(
          ')',
          inicioUrl,
        );

        if (inicioUrl == -1 || fimUrl == -1) {
          continue;
        }

        final pdfUrl = linha.substring(
          inicioUrl + 1,
          fimUrl,
        );

        String autor = 'Autor não informado';

        final resto = linha.substring(
          fimUrl + 1,
        ).trim();

        if (resto.startsWith('-')) {
          autor = resto.substring(1).trim();
        }

        autor = autor.replaceAll('(PDF)', '').trim();

        if (autor.contains('(')) {
          autor = autor.substring(
            0,
            autor.indexOf('('),
          ).trim();
        }
        final capaUrl = await buscarCapa(
          titulo,
          autor,
        );

        livros.add(
          Livros(
            titulo: titulo,
            autor: autor,
            pdfUrl: pdfUrl,
            capaUrl: capaUrl,
          ),
        );
      }

      return livros;
    } catch (e) {
      print('Erro ao buscar livros de C: $e');
      rethrow;
    }
  }
  Future<String> buscarCapa(
    String titulo,
    String autor,
  ) async {
    try {
      final resposta = await dio.get(
        urlOpenLibrary,
        queryParameters: {
          'title': titulo,
          'author': autor,
          'limit': 1,
        },
      );

      final dados = resposta.data;

      if (dados['docs'] != null &&
          dados['docs'].isNotEmpty) {
        final livro = dados['docs'][0];

        if (livro['cover_i'] != null) {
          final coverId = livro['cover_i'];

          return 'https://covers.openlibrary.org/b/id/$coverId-L.jpg';
        }
      }

      return '';
    } catch (e) {
      print(
        'Erro ao buscar capa de "$titulo": $e',
      );

      return '';
    }
  }
}
