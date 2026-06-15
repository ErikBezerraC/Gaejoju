import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetogaejoju/widget/jogo_add.dart';

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

      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context,i) {
          return JogoAdd(nome: 'joguinho',
            urlImg: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBrFLImfAnNxnQUyW-zhROVQulQTquZWhnG7Hu7dk7cw&s=10',);
        }
      )

    );
  }
}