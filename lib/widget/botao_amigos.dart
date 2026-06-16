import 'package:flutter/material.dart';

class BotaoAmigos extends StatefulWidget {
  Widget telaRetorno;
  IconData icone;

  BotaoAmigos({super.key, required this.telaRetorno, required this.icone});

  @override
  State<BotaoAmigos> createState() => _BotaoAmigosState();
}

class _BotaoAmigosState extends State<BotaoAmigos> {
  @override
  Widget build(BuildContext context) {
    return Container(

        width: 50,
        height: 48,

        decoration: BoxDecoration(
            color: Color(0xFFA770F4),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.deepPurple,
              width: 3,
            )
        ),

        child: Center(
          child: IconButton(
            icon: Icon(widget.icone, color: Colors.white, size:30),

            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => widget.telaRetorno
                  )
              );
            },
          ),
        )
    );
  }
}
