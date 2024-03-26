import 'package:flutter/material.dart';

class IndividualSignUp extends StatefulWidget {
  const IndividualSignUp({Key? key}) : super(key: key);

  @override
  State<IndividualSignUp> createState() => _IndividualSignUpState();
}

class _IndividualSignUpState extends State<IndividualSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(), // Empty body
    );
  }
}