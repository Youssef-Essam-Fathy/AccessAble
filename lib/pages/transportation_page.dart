import 'package:flutter/material.dart';

class TransportationPage extends StatelessWidget {
  const TransportationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transportation Page'),
      ),
      body: Center(
        child: Text('This is the Transportation Page'),
      ),
    );
  }
}