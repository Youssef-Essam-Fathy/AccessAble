import 'package:flutter/material.dart';

class TransportationPage extends StatelessWidget {
  const TransportationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transportation Page'),
      ),
      body: const Center(
        child: Text('This is the Transportation Page'),
      ),
    );
  }
}