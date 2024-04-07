import 'dart:async';

import 'package:accessable/presentation/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HandicappedTransportationPage extends StatefulWidget {
  const HandicappedTransportationPage({super.key});

  @override
  State<HandicappedTransportationPage> createState() =>
      _HandicappedTransportationPageState();
}

class _HandicappedTransportationPageState
    extends State<HandicappedTransportationPage> {
  GoogleMapController? _controller;

  static const CameraPosition camPosition = CameraPosition(
    target: LatLng(30.178980, 31.217581),
    zoom: 14.4746,
  );

  List<Marker> allMarkers = [];
  StreamSubscription<Position>? positionStream;

  initialStream() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
      if (permission == LocationPermission.whileInUse) {
        positionStream =
            Geolocator.getPositionStream().listen((Position? position) {
              allMarkers.add(Marker(
                  markerId: const MarkerId('currentLocation'),
                  position: LatLng(position!.latitude, position.longitude)));
              _controller!.animateCamera(CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)));
              setState(() {

              });
            });
      }
    }
  }

  @override
  void dispose() {
    positionStream!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    initialStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30), // adjust the curve as needed
        child: Scaffold(
          body: Container(
            height: 500,
            child: Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    onTap: (LatLng latLng) {
                      print("==================");
                      print(latLng.latitude);
                      print(latLng.longitude);
                      print("==================");
                      allMarkers.add(Marker(
                          markerId: const MarkerId('currentLocation'),
                          position: LatLng(latLng.latitude, latLng.longitude)));
                      setState(() {});
                    },
                    markers: allMarkers.toSet(),
                    mapType: MapType.normal,
                    initialCameraPosition: camPosition,
                    onMapCreated: (mapController) {
                      _controller = mapController;
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
