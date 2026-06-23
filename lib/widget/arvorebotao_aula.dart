import 'package:flutter/material.dart';
import 'package:projetogaejoju/widget/botao_aula.dart';
import 'package:projetogaejoju/domain/aulas.dart';

class ArvoreAula extends StatefulWidget {
  final Aula aula;
  final VoidCallback? onBotaoPrincipalTap;

  const ArvoreAula({
    super.key,
    required this.aula,
    this.onBotaoPrincipalTap,
  });

  @override
  State<ArvoreAula> createState() => _ArvoreAulaState();
}

class _ArvoreAulaState extends State<ArvoreAula> {
  late List<bool> fases;

  @override
  void initState() {
    super.initState();
    fases = widget.aula.listaFasesConcluidas;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 830,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.aula.imagem),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 40),

          BotaoPrincipal(
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
            onTap: () {
              setState(() {
                fases[2] = !fases[2];
              });
            },
            icone: fases[2]
                ? Icons.star
                : Icons.star_border_outlined,
          ),

          BotaoFase(
            onTap: () {
              setState(() {
                fases[3] = !fases[3];
              });
            },
            icone: fases[3]
                ? Icons.star
                : Icons.star_border_outlined,
          ),

          BotaoPrincipal(
            onTap: () {
              setState(() {
                fases[4] = !fases[4];
              });
            },
            icone: fases[4]
                ? Icons.star
                : Icons.star_border_outlined,
          ),
        ],
      ),
    );
  }
}