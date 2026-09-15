import 'package:projetogaejoju/domain/cat.dart';
import 'package:dio/dio.dart';

class CatApi {
  final dio = Dio();

  Future<Cat> showCats() async {

    final response = await dio.get('https://cataas.com/cat?json=true');

    if (response.statusCode == 200) {
      final catObj = Cat.fromJson(response.data);
      return catObj;
    }
    throw Exception('Erro ao buscar dados do gato. Status: ${response.statusCode}');
  }
}