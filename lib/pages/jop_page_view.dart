import 'package:flutter/material.dart';

class JobViewPage extends StatelessWidget {
  final Map<String, dynamic> job;

  JobViewPage({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job['Position'] ?? 'No title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Email: ${job['emailToConnect'] ?? 'No email'}'),
            // Add more Text widgets here for other job properties
          ],
        ),
      ),
    );
  }
}