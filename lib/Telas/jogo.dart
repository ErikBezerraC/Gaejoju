
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetogaejoju/domain/jogo.dart';
import 'package:projetogaejoju/db/jogo_dao.dart';
import 'package:projetogaejoju/widget/jogo_add.dart';

class Jogos extends StatefulWidget {
  const Jogos({super.key});

  @override
  State<Jogos> createState() => _JogoState();
}

class _JogoState extends State<Jogos> {


  List<Jogo> listaJogos = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    // Buscamos direto para a sua variável listaJogos
    listaJogos = await JogoDao().listarJogos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4F2B82),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        flexibleSpace: Container( // flexibleSpace está sendo usado para colocar widgets personalizados dentro do app bar.
          child: Align(
            alignment: Alignment.bottomCenter,
              child: Container(
                  height: 60,
                  width: 362,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 13), //edgeinsets usado para colocar a borda sem precisar colocar um valor para cada lado.
                  decoration: BoxDecoration(//decoration é uma propriedade do widget Container usada ara decoralo.
                      color: Color(0xFFA770F4),
                      borderRadius: BorderRadius.circular(15) //box decoration pra deixar circular
                  ),
                  child: Center(
                      child: Text('Jogos', style: GoogleFonts.comicNeue(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                      )
                  ),
            ),
          ),
        ),
      ),

      backgroundColor: Color(0xFF4F2B82),

      body: listaJogos.isEmpty
          ? const Center(
        child: CircularProgressIndicator(color: Colors.white),
      )
          : ListView.builder(
        itemCount: listaJogos.length, // Usa o tamanho real da sua lista
        itemBuilder: (context, i) {
          // Passa o item direto da sua listaJogos usando o índice [i]
          return JogoAdd(jogo: listaJogos[i]);
        },
      ),

    );
  }
}