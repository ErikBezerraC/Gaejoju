import 'package:flutter/material.dart';

class BotaoPrincipal extends StatelessWidget{
  VoidCallback? onTap;
  IconData icone;
  Color cor;

  BotaoPrincipal({
    super.key,
    this.onTap,
    required this.icone,
    this.cor = const Color(0xFF8D55DD),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: cor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(icone, size: 45, color: Colors.white),
        ),
      ),
    );
  }
}

class BotaoFase extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icone;
  final Color cor;

  const BotaoFase({
    super.key,
    this.onTap,
    this.icone = Icons.star_border_outlined,
    this.cor = Colors.deepPurple,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: cor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(icone, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}
