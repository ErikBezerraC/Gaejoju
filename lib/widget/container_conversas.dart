import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetogaejoju/domain/conversas.dart';

class ContainerConversas extends StatefulWidget {
  Conversas conversas;

  ContainerConversas({super.key, required this.conversas});

  @override
  State<ContainerConversas> createState() => _ConversasState();
}

class _ConversasState extends State<ContainerConversas> {
  @override
  Widget build(BuildContext context) {
    return ListTile( //ele ja vem com uma identação para algo na esquerda e na direita, uma msg e um subtitulo

      leading: CircleAvatar( //leading é oq tem no lado esquerdo, no nosso caso e a foto da pessoa
        radius: 30,
        backgroundImage: NetworkImage(widget.conversas.img,),
      ),

      title: Text(widget.conversas.nome,style:GoogleFonts.comicNeue(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 23,
      ),
      ),
      subtitle: Text(widget.conversas.msg,style:GoogleFonts.comicNeue(
          color: Colors.white.withOpacity(0.6), //deixa mais transparente
          fontWeight: FontWeight.bold,
          fontSize: 13
      ),
      ),
      trailing: Text(widget.conversas.hora,style:GoogleFonts.comicNeue(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12
      ),
      ), //é o mesm oque o leading soq no lado direito

    );
  }
}
