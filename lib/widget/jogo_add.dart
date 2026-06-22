import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetogaejoju/domain/jogo.dart';



class JogoAdd extends StatefulWidget {

  final Jogo jogo;

  JogoAdd({super.key, required this.jogo});

  @override
  State<JogoAdd> createState() => _JogoAddState();
}

class _JogoAddState extends State<JogoAdd> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(

        width: 365,
        height: 355,
        decoration: BoxDecoration(
          color: Color(0xFFA770F4),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.deepPurple,
            width: 4
          ),
        ),

        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(

              height: 40,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
              ),
            margin: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),

              child: Center(
                child: Text(widget.jogo.nome,//retornando a variavel.
                  style: GoogleFonts.comicNeue(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,), //cria um espaçamento vertical 20 pixels.

            Container(
              height: 200, // define tamanho fixo.
              width: double.infinity,//ocupa toda a largura disponível na horizontal.
              child: Center(
                  child: Image.asset(widget.jogo.urlImg,
                    height: 150,
                    width: 400,
                    fit: BoxFit.contain, //caber inteira dentro do espaço disponível emanter a proporção original.
                  )
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // deixa espaçamento igual antes, entre e depois.
              children: [

                ContainerBotaoJogo(),

                ContainerBotaoRanking(),


              ],
            ),

          ],
        ),
      ),
    );
  }
}

ContainerBotaoJogo(){
  return Container(

    height: 40,
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color:  Colors.deepPurple,
        width: 5
      )
    ),

    child: ElevatedButton(
      onPressed: () {},// define oq acontece quando o botão é pressionado. o botão não faz nada ainda mas continua clicável.
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF8858C7),
      ),
      child: Text('Jogar',
        style: GoogleFonts.comicNeue(
          color: Color(0xFFFFFFFF),
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
    ),
  );
}

ContainerBotaoRanking(){
  return Container(

    height: 40,
    width: 90,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color:  Colors.yellow,
            width: 5
        )
    ),

    child: ElevatedButton(
      onPressed: () {},// define oq acontece quando o botão é pressionado. o botão não faz nada ainda mas continua clicável.
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFDCE29),
      ),
      child: Icon(Icons.emoji_events,color: Colors.white,),
    ),
  );
}