import 'package:projetogaejoju/domain/jogo.dart';
import 'package:dio/dio.dart';

class AddressApi {
  final dio = Dio();

  Future<Address0> findByCep(String cep) async {
    late Address address;
    final response = await dio.get('https://emojihub.yurace.pro/api/random');

    if (response.statusCode == 200) {
      address = Address.fromJson(response.data);
    }

    return address;
  }
}