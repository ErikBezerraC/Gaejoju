import 'package:flutter/material.dart';

class Mascote extends StatefulWidget {
  const Mascote({super.key});

  @override
  State<Mascote> createState() => _MascoteState();
}

class _MascoteState extends State<Mascote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Mascote')));
  }
}
