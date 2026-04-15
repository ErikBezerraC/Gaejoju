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
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,color: Colors.white,),
            suffixIcon: Icon(Icons.computer,color: Colors.white),
            hintText: 'Pesquisar',
            hintStyle: TextStyle(
              color: Colors.white70, // cor do hint
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: Colors.white, // cor da borda
                  width: 4, // grossura
                ),
            ),

          ),
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
