import 'package:projetogaejoju/domain/cat.dart';
import 'package:dio/dio.dart';

class CatApi {
  final dio = Dio();

  Future<Address> showCats(String cat) async {

    //fazendo requisiçao json *get:
    final response = await dio.get('https://cataas.com/cat?json=true');

    if (response.statusCode == 200) {
      address = Address.fromJson(response.data);
    }

    return address;
  }
}