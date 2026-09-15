import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/livros_api.dart';
import '../domain/livros.dart';

class RecomendacaoLivros extends StatefulWidget {
  const RecomendacaoLivros({super.key});

  @override
  State<RecomendacaoLivros> createState() =>
      _RecomendacaoLivrosState();
}

class _RecomendacaoLivrosState
    extends State<RecomendacaoLivros> {

  final LivrosApi livrosApi = LivrosApi();

  List<Livros> livros = [];

  bool carregando = true;

  String? erro;

  @override
  void initState() {
    super.initState();

    carregarLivros();
  }

  Future<void> carregarLivros() async {
    try {
      setState(() {
        carregando = true;
        erro = null;
      });

      final resultado =
          await livrosApi.listarLivrosC();

      setState(() {
        livros = resultado;
        carregando = false;
      });
    } catch (e) {
      print('Erro ao carregar livros: $e');

      setState(() {
        carregando = false;
        erro = 'Não foi possível carregar os livros.';
      });
    }
  }

  Future<void> abrirPdf(String url) async {
    final Uri uri = Uri.parse(url);

    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      print('Erro ao abrir PDF: $e');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Não foi possível abrir o PDF.',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,

        title: Container(
          height: 45,
          width: double.infinity,

          decoration: BoxDecoration(
            color: const Color(0xFFA770F4),
            borderRadius: BorderRadius.circular(15),
          ),

          child: Row(
            children: [
              const SizedBox(width: 12),

              Text(
                'LIVROS',
                style: GoogleFonts.comicNeue(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.menu_book,
                color: Colors.white,
                size: 28,
              ),

              const SizedBox(width: 10),
            ],
          ),
        ),
      ),

      body: RefreshIndicator(
        onRefresh: carregarLivros,

        child: ListView(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
            bottom: 30,
          ),

          children: [
            // ============================================
            // TÍTULO
            // ============================================

            Center(
              child: Text(
                'RECOMENDAÇÕES',
                style: GoogleFonts.comicNeue(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 5),

            Center(
              child: Text(
                'Livros gratuitos para aprender C',
                textAlign: TextAlign.center,
                style: GoogleFonts.comicNeue(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ============================================
            // CARREGANDO
            // ============================================

            if (carregando)
              Column(
                children: [
                  const SizedBox(height: 100),

                  const CircularProgressIndicator(
                    color: Colors.white,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Buscando livros...',
                    style: GoogleFonts.comicNeue(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )

            // ============================================
            // ERRO
            // ============================================

            else if (erro != null)
              Column(
                children: [
                  const SizedBox(height: 80),

                  const Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 70,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    erro!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comicNeue(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: carregarLivros,

                    child: Container(
                      width: 150,
                      height: 45,

                      decoration: BoxDecoration(
                        color: const Color(0xFFA770F4),
                        borderRadius:
                            BorderRadius.circular(15),
                      ),

                      child: Center(
                        child: Text(
                          'TENTAR NOVAMENTE',
                          style:
                              GoogleFonts.comicNeue(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )

            // ============================================
            // LISTA VAZIA
            // ============================================

            else if (livros.isEmpty)
              Column(
                children: [
                  const SizedBox(height: 80),

                  const Icon(
                    Icons.menu_book_outlined,
                    color: Colors.white,
                    size: 70,
                  ),

                  const SizedBox(height: 15),

                  Text(
                    'Nenhum livro encontrado.',
                    style: GoogleFonts.comicNeue(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )

            // ============================================
            // LIVROS
            // ============================================

            else
              Column(
                children: [
                  for (int i = 0; i < livros.length; i++)
                    livroCard(livros[i]),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget livroCard(Livros livro) {
    return Container(
      width: double.infinity,

      margin: const EdgeInsets.only(
        bottom: 20,
      ),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: const Color(0xFFA770F4),
        borderRadius: BorderRadius.circular(20),

        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),

      child: Column(
        children: [
          // ==========================================
          // CAPA
          // ==========================================

          ClipRRect(
            borderRadius: BorderRadius.circular(12),

            child: livro.capaUrl.isNotEmpty
                ? Image.network(
                    livro.capaUrl,

                    width: 150,
                    height: 210,

                    fit: BoxFit.cover,

                    errorBuilder:
                        (
                          context,
                          error,
                          stackTrace,
                        ) {
                      return capaPadrao();
                    },
                  )
                : capaPadrao(),
          ),

          const SizedBox(height: 15),

          // ==========================================
          // TÍTULO
          // ==========================================

          Text(
            livro.titulo,

            textAlign: TextAlign.center,

            style: GoogleFonts.comicNeue(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // ==========================================
          // AUTOR
          // ==========================================

          Text(
            'Autor: ${livro.autor}',

            textAlign: TextAlign.center,

            style: GoogleFonts.comicNeue(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          // ==========================================
          // BOTÃO PDF
          // ==========================================

          GestureDetector(
            onTap: () {
              abrirPdf(livro.pdfUrl);
            },

            child: Container(
              width: 180,
              height: 45,

              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius:
                    BorderRadius.circular(15),

                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [
                  const Icon(
                    Icons.picture_as_pdf,
                    color: Colors.white,
                    size: 24,
                  ),

                  const SizedBox(width: 8),

                  Text(
                    'LER PDF',
                    style: GoogleFonts.comicNeue(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget capaPadrao() {
    return Container(
      width: 150,
      height: 210,

      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [
          const Icon(
            Icons.menu_book,
            color: Colors.white,
            size: 70,
          ),

          const SizedBox(height: 10),

          Text(
            'Livro de C',
            textAlign: TextAlign.center,
            style: GoogleFonts.comicNeue(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
