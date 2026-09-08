import 'package:aula_923/domain/Address.dart';
import 'package:dio/dio.dart';

class AddressApi {
  final dio = Dio();

  Future<Address> findByCep(String cep) async {
    late Address address;
    final response = await dio.get('https://viacep.com.br/ws/$cep/json/');

    if (response.statusCode == 200) {
      address = Address.fromJson(response.data);
    }

    return address;
  }
}