import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Revisao extends StatefulWidget {
  const Revisao({super.key});

  @override
  State<Revisao> createState() => _RevisaoState();
}

class _RevisaoState extends State<Revisao> {
  @override
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
        body: Padding(padding:
        EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
          bottom: 0, //alterando as bordas
        ),
          child: SingleChildScrollView(
            child:Column(
            children: [ //adiciona um espaço entre os containers
              buildContainer(assunto: 'VARIÁVEIS'),
              SizedBox(height: 20), //adiciona um espaço entre os containers
              buildContainer(assunto: 'OPERAÇÕES '),
              SizedBox(height: 20), //adiciona um espaço entre os containers
              buildContainer(assunto: 'CONDIÇÃO'),
              SizedBox(height: 20), //adiciona um espaço entre os containers
              buildContainer(assunto: 'REPETIÇÃO'),
              SizedBox(height: 20), //adiciona um espaço entre os containers
              buildContainer(assunto: 'FUNÇÃO'),
              SizedBox(height: 20), //adiciona um espaço entre os containers
              buildContainer(assunto: 'BIBLIOTECAS')
            ],
            )
          ),
        ),
    );
  }
}

buildContainer({required String assunto}){
  return Container(
    width: 350,
    height: 100, //tamanho do container
    decoration: BoxDecoration(
      color: Color(0xFFA770F4), //adicionando cor de fundo
      borderRadius: BorderRadius.circular(8), //arredondando as bordas
    ),
    
    child: Center(
        child: Text(assunto,
          style: GoogleFonts.comicNeue(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold))),
  );
}
