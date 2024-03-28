import 'package:flutter/material.dart';

class ServiceDetailsPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const ServiceDetailsPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the specific service page
            },
            child: Text('Go to $title'),
          ),
        ],
      ),
    );
  }
}