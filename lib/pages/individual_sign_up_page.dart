import 'package:flutter/material.dart';

class IndividualSignUp extends StatelessWidget {
  const IndividualSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              'assets/images/accessable_logo.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            // Add your widgets here
            ElevatedButton(
              onPressed: () {
                // Handle sign up
                Navigator.pushNamed(context, '/signIn');
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}