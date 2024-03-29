import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class JobPage extends StatelessWidget {
  const JobPage({Key? key}) : super(key: key);

  Future<String> getUserCollection() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return '';

    final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    return doc['collection'] as String;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getUserCollection(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final collection = snapshot.data;

        if (collection == 'customers') {
          return Scaffold(
            appBar: AppBar(
              title: Text('Job Page for $collection'),
            ),
            body: Center(
              child: Text('This is the Job Page for $collection'),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Job Page'),
            ),
            body: const Center(
              child: Text('This is the Job Page'),
            ),
          );
        }
      },
    );
  }
}