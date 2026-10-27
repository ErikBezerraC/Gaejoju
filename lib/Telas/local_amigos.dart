import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projetogaejoju/Telas/amigos.dart';
import 'package:projetogaejoju/Telas/home_page.dart';

class Localamigos extends StatefulWidget {
  String locationName;

  Localamigos({super.key, required this.locationName});

  @override
  State<Localamigos> createState() => _LocalamigosState();
}

class _LocalamigosState extends State<Localamigos> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final Geocoding geocoding = Geocoding();

  Set<Marker> markers = {};

  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    List<Location> locations = await geocoding.locationFromAddress(
      widget.locationName,
    );

    CameraPosition location = CameraPosition(
      target: LatLng(locations[0].latitude, locations[0].longitude),
      zoom: 13,
    );

    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(location));

    Marker marker1 = Marker(
      markerId: MarkerId('Amigo'),
      position: LatLng(locations[0].latitude, locations[0].longitude),
      infoWindow: InfoWindow(title: 'Localização do amigo'),
    );

    setState(() {
      markers.add(marker1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4F2B82),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            child: SizedBox(
              height: 500,
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                initialCameraPosition: const CameraPosition(
                  target: LatLng(-9.6658, -35.7353),
                  zoom: 8,
                ),
                markers: markers,
              ),
            ),
          ),

          SizedBox(height: 20),

          Row(
            children: [
              SizedBox(width: 15),
              Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFA770F4),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Center(
                  child: Text(
                    'Onde Está Seu Amigo?',
                    style: GoogleFonts.comicNeue(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 25),

              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
