import 'package:flutter/material.dart';

class Aulas extends StatefulWidget {
  const Aulas({super.key});

  @override
  State<Aulas> createState() => _AulasState();
}

class _AulasState extends State<Aulas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Aulas')));
  }
}
