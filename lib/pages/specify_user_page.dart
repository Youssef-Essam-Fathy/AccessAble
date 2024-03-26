import 'package:flutter/material.dart';

class SpecifyUserPage extends StatelessWidget {
  const SpecifyUserPage({Key? key}) : super(key: key);

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
      body: ListView(
        children: <Widget>[
          Image.asset(
            'assets/images/accessable_logo.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 70.0),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 120.0),
                child: Text(
                  'Are you a customer or a business?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/customerSignUp');
                },
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/young-businessman-icon.png',
                      width: MediaQuery.of(context).size.width * 0.20,
                      fit: BoxFit.cover,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/customerSignUp');
                      },
                      child: const Text('Customer'),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/businessSignUp');
                },
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/about-us-icon.png',
                      width: MediaQuery.of(context).size.width * 0.35,
                      fit: BoxFit.cover,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/businessSignUp');
                      },
                      child: const Text('Business'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}