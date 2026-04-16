import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Amigos extends StatefulWidget {
  const Amigos({super.key});

  @override
  State<Amigos> createState() => _AmigosState();
}

class _AmigosState extends State<Amigos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4F2B82),
        toolbarHeight: 90, //aumenta o tamanho da app bar
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //para ir do começo do column
          children: [
            Text(
              'AMIGOS', //nome lá em cima
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
                  hintText: 'Pesquisar', //esse texto fica sumidinho e quando escreve desaparece
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
      
      body: ListView(
        children: [
          conversas(nome: 'Taylor Swift', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe0fRq-Y13eilOU5TRxLv0PXf2xT-kiUT__w&s', msg: 'Hi, Im taylor', hora: '13:13'),
          conversas(nome: 'Lady gaga', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoag78eTwZLaauW9vUlROdFkj82lKetZzMXA&s', msg: 'Dont call me gaga', hora: '9:11'),
          conversas(nome: 'Juliano Floss', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaFFy4koCXHyanRg5eSX3JPMFvME0Wwaa-vQ&s', msg: 'Já papou coxinha fofa?', hora: '3:33')
        ],
      ),
    );
  }
}

conversas({required String nome,required String img, required String msg, required String hora}){
  return ListTile( //ele ja vem com uma identação para alog na esquerda e na direita, uma msg e um subtitulo
    
    leading: CircleAvatar( //leading é oq tem no lado direito, no nosso caso e a foto da pessoa
      radius: 30,
      backgroundImage: NetworkImage(img,),
    ),
    
    title: Text(nome,style:GoogleFonts.comicNeue(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
    ),
    subtitle: Text(msg,style:GoogleFonts.comicNeue(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 13
        ),
    ),
    trailing: Text(hora,style:GoogleFonts.comicNeue(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12
        ),
    ), //é o mesm oque o leading soq no lado esquerdo
    
  );
}