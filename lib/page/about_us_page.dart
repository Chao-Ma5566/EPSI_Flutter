import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AboutUs extends StatelessWidget {
  AboutUs({super.key});
  final _controller = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Center(child: Text("About Us")),
          ),
        ),
      body:FlutterMap(
          mapController: _controller,
          options: MapOptions(
            initialCenter: LatLng(47.2061507269755, -1.5394112547796752),
            initialZoom: 17,
          ),
          children: [
              TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png"
              ),
            MarkerLayer(markers: [
              Marker(
                alignment: Alignment.center,
                  point: LatLng(47.2061507269755, -1.5394112547796752),
                  child:
                  SchoolIcon()
              )])
          ]
      )
    );
  }
}

class SchoolIcon extends StatelessWidget {
  const SchoolIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('EPSI HEP Nantes'),
          content: const Text('Une Super école! Adresse: blabla'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: Icon(Icons.school, size: 64,),
    );
  }
}