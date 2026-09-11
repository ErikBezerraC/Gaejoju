import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetogaejoju/api/address_api.dart';
import 'package:projetogaejoju/domain/jogo.dart';
import 'package:projetogaejoju/domain/Address.dart';
import 'package:projetogaejoju/db/jogo_dao.dart';
import 'package:projetogaejoju/widget/jogo_add.dart';

class Jogos extends StatefulWidget {
  const Jogos({super.key});

  @override
  State<Jogos> createState() => _JogoState();
}

class _JogoState extends State<Jogos> {
  late Future<List<Jogo>> futureLista;

  //interrogação pois o valor pode ser nulo
  Cat? gato;

  @override
  void initState() {
    super.initState();

    futureLista = JogoDao().listarJogos();


  }

  Future<void> mostrarGato() async {
    final resultado = await AddressApi().showCats('');

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

          // Lista de jogos
          Expanded(
            child: FutureBuilder(
              future: futureLista,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List listaJogos = snapshot.requireData;

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

          // Gatinho no final
          if (gato != null)
            Image.network(
              'https://cataas.com${gato!.url}',
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),

          // Botão
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