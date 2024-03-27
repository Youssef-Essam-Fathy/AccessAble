import 'package:flutter/material.dart';

class BusinessSignUpPage extends StatelessWidget {
  const BusinessSignUpPage({Key? key}) : super(key: key);

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
                      Text(
                        'Company',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/individualSignUp');
                  },
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/young-businessman-icon.png',
                        width: MediaQuery.of(context).size.width * 0.25,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Individual',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
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