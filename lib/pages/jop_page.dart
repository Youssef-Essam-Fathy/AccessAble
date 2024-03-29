import 'package:flutter/material.dart';

class JobPage extends StatelessWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Page'),
      ),
      body: Center(
        child: Text('This is the Job Page'),
      ),
    );
  }
}