import 'package:dio/dio.dart';
import '../domain/perfis.dart';

class PerfilApi {
  final Dio dio = Dio();

  Future<List<Perfis>> listarPerfis() async {
    final resposta = await dio.get(
      'https://my-json-server.typicode.com/ErikBezerraC/fake_api/PERFIS',
    );

    List<Perfis> listarPerfis = [];

    for (var json in resposta.data) {
      Perfis perfil = Perfis.fromJson(json);
      listarPerfis.add(perfil);
    }

    return listarPerfis;
  }

  Future<bool> login(String email, String password) async {
    try {
      final perfis = await listarPerfis();

      for (var perfil in perfis) {
        if (perfil.email == email &&
            perfil.password == password) {
          return true;
        }
      }

      return false;
    } catch (e) {
      print('Erro ao fazer login: $e');
      return false;
    }
  }
}
