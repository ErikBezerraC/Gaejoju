import 'package:dio/dio.dart';
import 'package:projetogaejoju/domain/videos.dart';

class VideoApi {
  final Dio dio = Dio();

  Future<List<Videos>> listarVideos() async {
    final resposta = await dio.get(
      'https://my-json-server.typicode.com/barbosajuliana13/fake_api_Gaejoju/VIDEOS',
    );

    List<Videos> listarVideos = [];

    for (var json in resposta.data) {
      Videos video = Videos.fromJson(json);
      listarVideos.add(video);
    }

    return listarVideos;
  }
}
