import 'package:flutter/material.dart';

class Ofensiva extends StatefulWidget {

  double tamanho1, tamanho2, tamanho3;

  Ofensiva({super.key, required this.tamanho1, required this.tamanho2, required this.tamanho3});

  @override
  State<Ofensiva> createState() => _OfensivaState();
}

class _OfensivaState extends State<Ofensiva> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(Icons.whatshot_outlined, color: Colors.red, size: widget.tamanho1),
        Icon(Icons.whatshot, color: Colors.deepOrangeAccent, size: widget.tamanho2),
        Icon(Icons.whatshot_outlined, color: Colors.amber, size: widget.tamanho3), //besteiragem pra fazer ficar bonitinho
      ],
    );
  }
}
