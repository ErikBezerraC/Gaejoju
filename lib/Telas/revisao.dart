import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetogaejoju/db/revisao_dao.dart';
import 'package:projetogaejoju/widget/revisao_buttom.dart';
import 'variaveis_revisao.dart';
import 'package:projetogaejoju/domain/revisao.dart';
import '';

class Revisar extends StatefulWidget {
  const Revisar({super.key});

  @override
  State<Revisar> createState() => _RevisarState();
}

class _RevisarState extends State<Revisar> {
  List<Revisao> listarrevisao = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listarrevisao = await RevisaoDao().listarrevisao();
    setState(() {});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4F2B82),
        toolbarHeight: 90, //aumenta o tamanho da app bar
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //para ir do começo do column, canto superior esquerdo
          children: [
            Text(
              'REVISÃO', //nome lá em cima
              style: GoogleFonts.comicNeue(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 5), //espaçamento da pesquisa

            SizedBox( //usei sizedbox para conseguir manipular o tamanho
              height: 40, //altura
              child: TextField( //campo de pesquisa em si
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration( //lê oq o usuario digita
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Pesquisar assuntos', //esse texto fica sumidinho e quando escreve desaparece
                  hintStyle: TextStyle(color: Colors.white70),

                  contentPadding: EdgeInsets.symmetric(vertical: 5),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),

        ),
        backgroundColor: Color(0xFF4F2B82),
        body: ListView.builder(
        itemCount: listarrevisao.length,
          itemBuilder: (context,i){
          return RevisaoButtom(revisao: listarrevisao[i],);
          },


        )
    );
  }
}

