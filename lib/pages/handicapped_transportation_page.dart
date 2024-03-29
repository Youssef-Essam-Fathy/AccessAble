import 'package:accessable/presentation/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HandicappedTransportationPage extends StatefulWidget {
  const HandicappedTransportationPage({super.key});

  @override
  _HandicappedTransportationPageState createState() =>
      _HandicappedTransportationPageState();
}

class _HandicappedTransportationPageState
    extends State<HandicappedTransportationPage> {
  late GoogleMapController mapController;
  late LatLng _center = const LatLng(0, 0);
  bool isMapControllerInitialized = false;
  double price = 0.0;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    isMapControllerInitialized = true; // Set the flag to true here
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
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
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    _center = LatLng(position.latitude, position.longitude);
    if (isMapControllerInitialized) {
      // Check if mapController is initialized before using it
      mapController.moveCamera(CameraUpdate.newLatLng(_center));
    }
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
          icon:
              Icon(Icons.arrow_back_ios_sharp, color: ColorManager.stormCloud),
        ),
      ),
      body: FutureBuilder(
        future: _determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
                  ),
                ),
                Text(
                  'Price: \$${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
