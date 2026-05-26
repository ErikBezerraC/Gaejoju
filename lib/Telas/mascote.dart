import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mascote extends StatefulWidget {
  const Mascote({super.key});

  @override
  State<Mascote> createState() => _MascoteState();
}

class _MascoteState extends State<Mascote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4F2B82),
        elevation: 0,
        flexibleSpace: Container( //flexiblespace é basicamente o conteúdo que sera colcoado na appbar(tipo child). O primeiro contrainer vai conter a cor secundária
          child: Align( //O Align é um widget usado pra posicionar um filho dentro de outro espaço. É tipo usar o stack para conseguir colocar duas informações no mesmo espaço
            alignment: Alignment.bottomCenter, //posiciona no centro na horizontal
            child: Container(//vamos colocar as informações da appbar aqui
              height: 60,
              width: 362,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 13), //adiconando margens
              decoration: BoxDecoration(
                  color: Color(0xFFA770F4),
                  borderRadius: BorderRadius.circular(15) //box decoration pra deixar circular
              ),
              child: Center(
                  child: Text('MASCOTE', style: GoogleFonts.comicNeue(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                  )
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF4F2B82),
      body: containerMascote(),
    );
  }
}
containerQuadrados({required String url}){
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
        color: Color(0xFF4F2B82),
        borderRadius: BorderRadius.circular(15)
    ),

    child: Center(
      child: Image.asset(url,height: double.infinity,width: double.infinity,),
    ),

  );
}
containerBackmascote(){
  return Container(
    height: 430,
    width: 360,
    decoration: BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Stack(
      children: [

        Center(
          child: Image.asset(
            'assets/mascoteLoja/mascote.png', // a imagem do mascote ta aqui
            height: 425,
            width: 365,
          ),
        ),

        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 60,
            width: 60,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.yellow, width: 5),
            ),
            child: Center(
              child: Icon(Icons.shopping_cart_sharp,
                  color: Colors.white, size: 33),
            ),
          ),
        ),
      ],
    ),
  );
}
containerArmariotitulo(){
  return Container(
    height: 40,
    width: 390,
    decoration: BoxDecoration(
        color: Color(0xFF8D55DE),
        borderRadius: BorderRadius.circular(5)
    ),
    child:
    Row(
      mainAxisAlignment: MainAxisAlignment.center, // centraliza na horizontal
      crossAxisAlignment: CrossAxisAlignment.start,//coloca pra cima
      children: [
        Icon(Icons.checkroom, color: Colors.white, size: 30),
        Text('-ROUPAS-', style: GoogleFonts.comicNeue(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30)),
        Icon(Icons.checkroom, color: Colors.white, size: 30),
      ],
    ),
  );
}
containerArmario(){
  return Container(
    height: 155,
    width: 390,
    decoration: BoxDecoration(
      color: Color(0xFFA770F4),
    ),
    child:
    Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 4,
            ),
            containerQuadrados(url: 'assets/mascoteLoja/QifreyIcon.png'),
            SizedBox(
              width: 4,
            ),

            containerQuadrados(url: 'assets/mascoteLoja/ZoroIcon.png'),
            SizedBox(
              width: 4,
            ),

          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xFF4F2B82),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.amber,
                width: 3
              ),
            ),

            child: Center(
              child: Image.asset('assets/mascoteLoja/default.png',height: double.infinity,width: double.infinity,),
            ),
            ),
            SizedBox(
              width: 4,
            ),
            containerQuadrados(url: 'assets/mascoteLoja/default.png'),
            SizedBox(
              width: 4,
            ),
            containerQuadrados(url: 'assets/mascoteLoja/default.png'),
            SizedBox(
              width: 4,
            ),
            containerQuadrados(url: 'assets/mascoteLoja/default.png'),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 4,                ),
            containerQuadrados(url: 'assets/mascoteLoja/default.png'),
            SizedBox(
              width: 4,                ),
            containerQuadrados(url: 'assets/mascoteLoja/default.png'),
            SizedBox(
              width: 4,                ),
            containerQuadrados(url: 'assets/mascoteLoja/default.png'),
            SizedBox(
              width: 4,                ),
            containerQuadrados(url: 'assets/mascoteLoja/default.png'),
            SizedBox(
              width: 4,                ),
            containerQuadrados(url: 'assets/mascoteLoja/default.png'),
            SizedBox(
              width: 4,                ),
            containerQuadrados(url: 'assets/mascoteLoja/default.png'),
          ],
        ),
      ],
    ),
  );
}
containerMascote(){
  return Container(
      child: Center(
          child:
          Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                containerBackmascote(),
                containerArmariotitulo(),
                containerArmario()
              ]
          )
      )
  );
}