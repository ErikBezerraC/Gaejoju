import 'package:projetogaejoju/domain/estado.dart';
import 'package:dio/dio.dart';

class EstadoService {
  final dio = Dio();

  Future<List<Estado>> buscarEstados() async {
    List<Estado> estados = [];
    final response = await dio.get('https://brasilapi.com.br/api/ibge/uf/v1');

    if (response.statusCode == 200) {
      estados = (response.data as List)
          .map((json) => Estado.fromJson(json))
          .toList();
    }

    return estados;
  }
}