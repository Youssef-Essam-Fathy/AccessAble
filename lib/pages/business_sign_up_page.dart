import 'package:flutter/material.dart';

class BusinessSignUpPage extends StatelessWidget {
  const BusinessSignUpPage({Key? key}) : super(key: key);

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
            padding: EdgeInsets.only(top: 80.0),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 100.0),
                child: Text(
                  'Are you a company or an individual?',
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
                  Navigator.pushNamed(context, '/companySignUp');
                },
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/building-icon.png',
                      width: MediaQuery.of(context).size.width * 0.25,
                      fit: BoxFit.cover,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/companySignUp');
                      },
                      child: const Text('Company'),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/companySignUp');
                },
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/young-businessman-icon.png',
                      width: MediaQuery.of(context).size.width * 0.25,
                      fit: BoxFit.cover,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/individualSignUp');
                      },
                      child: const Text('Individual'),
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