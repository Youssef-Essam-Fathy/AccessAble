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
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30), // adjust the curve as needed
        child: Scaffold(
          body: GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ));
  }
}
