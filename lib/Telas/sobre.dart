import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Sobre extends StatefulWidget {
  const Sobre({super.key});

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4F2B82),
        title: Row(
          children: [
            Text('Onde nossa história começou', style: GoogleFonts.comicNeue(
              color: Colors.purpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF4F2B82),
    );
  }
}
