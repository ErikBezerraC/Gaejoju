import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetogaejoju/api/cat_api.dart';
import 'package:projetogaejoju/api/jogos_api.dart';
import 'package:projetogaejoju/domain/jogo.dart';
import 'package:projetogaejoju/domain/cat.dart';
import 'package:projetogaejoju/widget/jogo_add.dart';

class JogosTela extends StatefulWidget {
  const JogosTela({super.key});

  @override
  State<JogosTela> createState() => _JogosTelaState();
}

class _JogosTelaState extends State<JogosTela> {
  late Future<List<Jogo>> futureLista;

  Cat? gato;

  @override
  void initState() {
    super.initState();
    futureLista = JogosApi().listarPropriedades();
  }

  Future<void> mostrarGato() async {
    final resultado = await CatApi().showCats();

    setState(() {
      gato = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F2B82),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              width: 362,
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 13,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFA770F4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'Jogos',
                  style: GoogleFonts.comicNeue(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF4F2B82),
      body: Column(
        children: [
          // Lista de jogos (API Fake)
          Expanded(
            child: FutureBuilder<List<Jogo>>(
              future: futureLista,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Jogo> listaJogos = snapshot.requireData;

                  return ListView.builder(
                    itemCount: listaJogos.length,
                    itemBuilder: (context, i) {
                      return JogoAdd(
                        jogo: listaJogos[i],
                      );
                    },
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),

          // Gatinho exibido após clicar no botão
          if (gato != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                'https://cataas.com/cat/${gato!.id}',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'Erro ao carregar imagem',
                    style: TextStyle(color: Colors.white),
                  );
                },
              ),
            ),

          // Botão para carregar o gatinho
          TextButton.icon(
            onPressed: mostrarGato,
            icon: const Icon(
              Icons.search,
              size: 18,
              color: Colors.white70,
            ),
            label: const Text(
              'gatinho',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}