import 'package:projetogaejoju/domain/jogo.dart';
import 'package:dio/dio.dart';

class AddressApi {
  final dio = Dio();

  Future<Address> showCats(String cat) async {
    late Address address;

    // retorna imagem: final response = await dio.get('https://cataas.com/cat');
    //retorna json:
    final response = await dio.get('https://cataas.com/cat?json=true');

    if (response.statusCode == 200) {
      Address.fromJson(response.data);
    }

    return address;
  }
}