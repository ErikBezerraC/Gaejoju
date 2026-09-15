import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/video_api.dart';
import '../domain/videos.dart';

class VariaveisRevisao extends StatefulWidget {
  const VariaveisRevisao({super.key});

  @override
  State<VariaveisRevisao> createState() => _VariaveisRevisaoState();
}

class _VariaveisRevisaoState extends State<VariaveisRevisao> {
  final VideoApi videoApi = VideoApi();

  List<Videos> videos = [];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarVideos();
  }

  Future<void> carregarVideos() async {
    try {
      final resultado = await videoApi.listarVideos();

      setState(() {
        videos = resultado;
        carregando = false;
      });
    } catch (e) {
      print('Erro ao carregar vídeos: $e');

      setState(() {
        carregando = false;
      });
    }
  }

  String obterThumbnail(String youtubeUrl) {
    Uri uri = Uri.parse(youtubeUrl);

    String videoId = '';

    if (uri.host.contains('youtu.be')) {
      if (uri.pathSegments.isNotEmpty) {
        videoId = uri.pathSegments.first;
      }
    } else if (uri.host.contains('youtube.com')) {
      videoId = uri.queryParameters['v'] ?? '';
    }

    return 'https://i.ytimg.com/vi/$videoId/maxresdefault.jpg';
  }

  Future<void> abrirVideo(String youtubeUrl) async {
    final Uri uri = Uri.parse(youtubeUrl);

    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      print('Erro ao abrir vídeo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F2B82),
        title: Container(
          height: 45,
          width: 400,
          decoration: BoxDecoration(
            color: const Color(0xFFA770F4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Text(
                'VARIÁVEIS',
                style: GoogleFonts.comicNeue(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),

      backgroundColor: const Color(0xFF4F2B82),

      body: ListView(
        children: [
          const SizedBox(height: 17),

          Center(
            child: Container(
              height: 1910,
              width: 365,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(0xFFA770F4),
                  width: 5,
                ),
              ),

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Text(
                      'Variáveis na linguagem C são espaços na memória usados para armazenar dados que podem ser modificados durante a execução do programa.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.comicNeue(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Image.asset(
                      'assets/revisao/revisaoVariaveis/tirinha.jpg',
                      height: 210,
                      width: 460,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Text(
                      'Antes de utilizá-las, é necessário declará-las informando o tipo, como int, float, char ou double. Elas podem ser inicializadas já na declaração, por exemplo: int idade = 20;. Os nomes das variáveis devem seguir regras, como não começar com números nem usar palavras reservadas. Além disso, podem ter escopo local (dentro de funções) ou global (fora delas). O uso correto de variáveis ajuda na organização e no bom funcionamento do programa.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.comicNeue(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),

                  divisao(),

                  // =========================
                  // BLOCO DE VÍDEO
                  // =========================

                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFA770F4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'VÍDEO AULA',
                        style: GoogleFonts.comicNeue(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // CARREGANDO VÍDEO
                  if (carregando)
                    const SizedBox(
                      width: 320,
                      height: 175,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    )

                  // VÍDEO ENCONTRADO
                  else if (videos.isNotEmpty)
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            abrirVideo(videos[0].youtubeUrl);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              obterThumbnail(
                                videos[0].youtubeUrl,
                              ),
                              width: 320,
                              height: 175,
                              fit: BoxFit.cover,

                              errorBuilder: (
                                context,
                                error,
                                stackTrace,
                              ) {
                                return Container(
                                  width: 320,
                                  height: 175,
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius:
                                        BorderRadius.circular(15),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.error,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Text(
                            videos[0].titulo,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.comicNeue(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'Clique na imagem para assistir',
                          style: GoogleFonts.comicNeue(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )

                  // NENHUM VÍDEO
                  else
                    Text(
                      'Nenhum vídeo encontrado.',
                      style: GoogleFonts.comicNeue(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  const SizedBox(height: 5),

                  divisao(),

                  // =========================
                  // BLOCO DAS QUESTÕES
                  // =========================

                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFA770F4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'QUESTÕES',
                        style: GoogleFonts.comicNeue(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    width: 330,
                    height: 780,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4F2B82),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 450,
                              height: 10,
                            ),
                            Text(
                              '1/10  ',
                              style: GoogleFonts.comicNeue(
                                color: Colors.amber,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Text(
                            'Em um programa de uma empresa se tem as variáveis nomeFuncionario, salarioFuncionario e idadeFuncionario. Monte o código de acordo com os tipos das variáveis:',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.comicNeue(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            '#include <stdio.h>',
                            style: GoogleFonts.comicNeue(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'int main() {',
                            style: GoogleFonts.comicNeue(
                              color: Colors.cyanAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),

                        const SizedBox(height: 3),

                        variavies(
                          variavel: 'nomeFuncionario',
                        ),

                        const SizedBox(height: 3),

                        variavies(
                          variavel: 'salarioFuncionario',
                        ),

                        const SizedBox(height: 3),

                        variavies(
                          variavel: 'idadeFuncionario',
                        ),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            ' return 0;',
                            style: GoogleFonts.comicNeue(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            '}',
                            style: GoogleFonts.comicNeue(
                              color: Colors.cyanAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          '--------------------------------------------------------------------------------',
                          style: TextStyle(
                            color: Color(0xFFA770F4),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            const SizedBox(width: 10),
                            adicionarVariaveis(
                              tipo: 'String',
                            ),
                            const SizedBox(width: 40),
                            adicionarVariaveis(
                              tipo: 'int',
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            const SizedBox(width: 10),
                            adicionarVariaveis(
                              tipo: 'float',
                            ),
                            const SizedBox(width: 40),
                            adicionarVariaveis(
                              tipo: 'boolean',
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Container(
                          height: 38,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.yellow,
                              width: 3,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Enviar',
                              style: GoogleFonts.comicNeue(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// FUNÇÕES AUXILIARES
// ======================================================

divisao() {
  return const Text(
    '--------------------------------------------------------------------------------------',
    style: TextStyle(
      color: Color(0xFFA770F4),
    ),
  );
}

variavelVazia() {
  return Container(
    width: 70,
    height: 30,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: Colors.white70,
        width: 2,
      ),
    ),
  );
}

variavies({required String variavel}) {
  return Row(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(15),
        child: variavelVazia(),
      ),

      const SizedBox(width: 7),

      Text(
        variavel,
        style: GoogleFonts.comicNeue(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

adicionarVariaveis({required String tipo}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 38,
          width: 120,
          decoration: BoxDecoration(
            color: const Color(0xFFA770F4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),

              Text(
                tipo,
                style: GoogleFonts.comicNeue(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Icon(
                Icons.add,
                color: Colors.amber,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
