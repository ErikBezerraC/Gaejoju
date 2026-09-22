import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projetogaejoju/domain/propriedades.dart';

class detalhes extends StatefulWidget {
  Propriedade propriedade;
  late LatLng location;

  detalhes({super.key, required this.propriedade, required this.location});

  @override
  State<detalhes> createState() => _Detalhes();
}

class _Detalhes extends State<detalhes> {
  // Metodo Get
  Propriedade get propriedade => widget.propriedade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: ListView(
        children: [
          Stack(
            children: [
              // (propriedade.urlImagem),
              Container(
                height: 400,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(target: widget.location, zoom: 14),
                ),
              ),
              Positioned(
                left: 16,
                top: 16,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 32),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
        
        ],
      ),
    );
  }
}