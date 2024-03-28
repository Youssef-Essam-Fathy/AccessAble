import 'package:accessable/presentation/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HandicappedTransportationPage extends StatefulWidget {
  @override
  _HandicappedTransportationPageState createState() => _HandicappedTransportationPageState();
}

class _HandicappedTransportationPageState extends State<HandicappedTransportationPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433); // replace with your desired location

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handicapped Transportation'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_sharp,
              color: ColorManager.stormCloud),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          ),
          // Add your price display widget here
        ],
      ),
    );
  }
}