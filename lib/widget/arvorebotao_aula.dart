import 'package:flutter/material.dart';
import 'package:projetogaejoju/widget/botao_aula.dart';
import 'package:projetogaejoju/domain/aulas.dart';

class ArvoreAula extends StatefulWidget {
  Aula aula;
  VoidCallback? onBotaoPrincipalTap;

  ArvoreAula({
    super.key,
    required this.aula,
    this.onBotaoPrincipalTap,
  });

  @override
  State<ArvoreAula> createState() => _ArvoreAulaState();
}

class _ArvoreAulaState extends State<ArvoreAula> {
  @override
  Widget build(BuildContext context) {
    final fasesConcluidas = int.tryParse(widget.aula.fasesConcluidas) ?? 0;
    final fases = fasesConcluidas >= 3
        ? [true, true, true] // ajuste conforme sua lógica
        : [false, false, false];

    return Container(
      width: 380,
      height: 830,

      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(widget.aula.imagem), fit: BoxFit.cover),
      ),

      child: Column(children: [
        const SizedBox(height: 40),

        BotaoPrincipal(),

        BotaoFase(
          onTap: () {
            setState(() {
              fases[0] = !fases[0];
            });
          },
          icone: fases[0]
              ? Icons.star
              : Icons.star_border_outlined,
        ),

        BotaoFase(
          onTap: () {
            setState(() {
              fases[1] = !fases[1];
            });
          },
          icone: fases[1]
              ? Icons.star
              : Icons.star_border_outlined,
        ),

        BotaoFase(
          onTap: fases[2] ? () {} : null,
          icone: fases[2]
              ? Icons.star
              : Icons.star_border_outlined,
        ),

        BotaoPrincipal(),
      ],
      ),
    );
  }
}

containerTraco(){
  return Container(
      child: Column(
          children: [
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
          ]
      )
  );
}