import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../domain/revisao.dart';

class RevisaoButtom extends StatefulWidget {
  Revisao revisao;


  RevisaoButtom({super.key, required this.revisao});

  @override
  State<RevisaoButtom> createState() => RevisaoButtomState();
}

class RevisaoButtomState extends State<RevisaoButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100, //tamanho do container
      decoration: BoxDecoration( //adicionando cor de fundo
        borderRadius: BorderRadius.circular(8), //arredondando as bordas
        image: DecorationImage(
          image: AssetImage(widget.revisao.url),
          fit: BoxFit.cover, //cobre o container inteiro
        ),
      ),

      child: Center(
          child: Text(widget.revisao.assunto,
              style: GoogleFonts.comicNeue(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold))),
    );
  }
}
