import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geocoding/geocoding.dart';
// REMOVA a linha: import 'package:google_maps/google_maps.dart';
// E REMOVA o 'hide LatLng' da linha abaixo:
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
            Text('ONDE COMEÇOU', style: GoogleFonts.comicNeue(
              color: Color(0xFFECA8D1),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF4F2B82),
      body: Column(
        children: [
        Container(
        color: Colors.amber,
        height: 500,
        child: GoogleMap(
          // Agora o LatLng será o do google_maps_flutter
          initialCameraPosition: const CameraPosition(
              target: LatLng(-9.6986, -36.6856),
              zoom: 13,
          ),
        )
        )
        ],
      ),
    );
  }
}