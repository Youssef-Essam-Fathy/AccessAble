import 'package:flutter/material.dart';

class SpecifyUserPage extends StatelessWidget {
  const SpecifyUserPage({Key? key}) : super(key: key);

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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
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
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}