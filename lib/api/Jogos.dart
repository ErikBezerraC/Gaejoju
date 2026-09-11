import 'package:projetogaejoju/domain/jogo.dart';
import 'package:dio/dio.dart';

class JogosApi {
  final dio = Dio();
  final baseUrl = 'https://my-json-server.typicode.com/tarsisms/fake_api';

  Future<List<Jogo>> listarPropriedades() async {
    final response = await dio.get('$baseUrl/propriedades');

    // Percorrer a lista de elementos
    List<Jogo> listaPropriedades = [];
    for (var json in response.data) {
      // Criar a Propriedade usando NamedConstructor
      Jogo jogo = Jogo.fromJson(json);

      // Add Propriedade na Lista
      listaPropriedades.add(Jogo.fromJson(json));
    }

    await Future.delayed(Duration(seconds: 5));
    return listaPropriedades;
  }
}