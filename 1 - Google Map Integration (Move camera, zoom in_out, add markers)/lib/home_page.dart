import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // * Initial camera position
  final _cameraPosition =
      const CameraPosition(target: LatLng(41.3123363, 69.2787079));
  // * To move the camera to the place where is tapped with animation
  late GoogleMapController _googleMapController;
  // * List of markers
  final List<Marker> _markers = [];

  putMarker(coordinate) {
    int id = Random().nextInt(100);
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(id.toString()),
        position: coordinate,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
          initialCameraPosition: _cameraPosition,
          mapType: MapType.normal,
          onMapCreated: (controller) {
            // * Initialize the google map controller
            setState(() {
              _googleMapController = controller;
            });
          },
          onTap: (coordinates) {
            // * To move the camera to the place where is tapped with animation
            _googleMapController.animateCamera(
              CameraUpdate.newLatLng(coordinates),
            );
            // * To put a marker where is tapped
            putMarker(coordinates);
          },
          markers: _markers.toSet(),
        ),
        floatingActionButton: Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  _googleMapController.animateCamera(CameraUpdate.zoomIn());
                },
                child: Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.indigo,
                  ),
                  child:
                      const Icon(Icons.zoom_in, color: Colors.white, size: 26),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _googleMapController.animateCamera(CameraUpdate.zoomOut());
                },
                child: Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.indigo,
                  ),
                  child:
                      const Icon(Icons.zoom_out, color: Colors.white, size: 26),
                ),
              ),
            ],
          ),
        ));
  }
}
