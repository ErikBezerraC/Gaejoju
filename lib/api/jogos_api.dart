import 'package:projetogaejoju/domain/jogo.dart';
import 'package:dio/dio.dart';

class JogosApi {
  final dio = Dio();
  final baseUrl = 'https://my-json-server.typicode.com/johnelionai33-arch/FakeApi';

  Future<List<Jogo>> listarPropriedades() async {
    final response = await dio.get('$baseUrl/jogos');

    List<Jogo> listaPropriedades = [];
    if (response.statusCode == 200 && response.data != null) {
      for (var json in response.data) {
        listaPropriedades.add(Jogo.fromJson(json));
      }
    }

    return listaPropriedades;
  }
}