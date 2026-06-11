import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4F2B82),
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

      body: ListView(
        children: [// chamando minha função.
          buildContainer('Dia a dia do sr. Guará'),
          buildContainer('Atravesse o Laguinho'),
          buildContainer('Quem programa mais rápido?'),
        ],
      ),

    );
  }
}

buildContainer(String nome){
  return Container(

    color: Color(0xFFA770F4),

    child: Column(
      children: [

        Container(
          child: Text(nome,//retornando a variavel.
            style: GoogleFonts.comicNeue(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            ),
          ),
        ),

        SizedBox(height: 20,), //cria um espaçamento vertical 20 pixels.

        Container(
          height: 200, // define tamanho fixo.
          width: double.infinity,//ocupa toda a largura disponível na horizontal.
          child: Center(
            child: Image.asset('assets/mascoteLoja/default.png',
            height: 150,
            fit: BoxFit.contain,  //caber inteira dentro do espaço disponível emanter a proporção original.
            )
          ),
        ),

        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // deixa espaçamento igual antes, entre e depois.
          children: [

            ElevatedButton(
              onPressed: () {},// define oq acontece quando o botão é pressionado. o botão não faz nada ainda mas continua clicável.
              style: ElevatedButton.styleFrom(
                //backgroundColor: Color(0xFFA770F4),
              ),
              child: Text('Jogar',
                  style: GoogleFonts.comicNeue(
                  color: Colors.white,
                    fontSize: 20,
              ),),
            ),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent,
              ),
              child: Icon(Icons.emoji_events),
            ),
          ],
        ),

        SizedBox(height: 20),

      ],
    ),
  );
}