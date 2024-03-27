import 'package:flutter/material.dart';

enum UserType { customer, business }
enum BusinessType { individual, company }

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  UserType? _userType;
  BusinessType? _businessType;
  String? _firstName, _lastName, _country, _disability, _age, _gender, _profile, _service;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: const Text('Customer'),
                leading: Radio(
                  value: UserType.customer,
                  groupValue: _userType,
                  onChanged: (UserType? value) {
                    setState(() {
                      _userType = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Business'),
                leading: Radio(
                  value: UserType.business,
                  groupValue: _userType,
                  onChanged: (UserType? value) {
                    setState(() {
                      _userType = value;
                    });
                  },
                ),
              ),
              if (_userType == UserType.business) ...[
                ListTile(
                  title: const Text('Individual'),
                  leading: Radio(
                    value: BusinessType.individual,
                    groupValue: _businessType,
                    onChanged: (BusinessType? value) {
                      setState(() {
                        _businessType = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Company'),
                  leading: Radio(
                    value: BusinessType.company,
                    groupValue: _businessType,
                    onChanged: (BusinessType? value) {
                      setState(() {
                        _businessType = value;
                      });
                    },
                  ),
                ),
              ],
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'First Name',
                ),
                onChanged: (value) => _firstName = value,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                ),
                onChanged: (value) => _lastName = value,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Country',
                ),
                onChanged: (value) => _country = value,
              ),
              if (_userType == UserType.customer) ...[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Disability',
                  ),
                  onChanged: (value) => _disability = value,
                ),
              ],
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
                onChanged: (value) => _age = value,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Gender',
                ),
                onChanged: (value) => _gender = value,
              ),
              if (_userType == UserType.customer) ...[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Profile (optional)',
                  ),
                  onChanged: (value) => _profile = value,
                ),
              ],
              if (_userType == UserType.business && _businessType == BusinessType.individual) ...[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Service',
                  ),
                  onChanged: (value) => _service = value,
                ),
              ],
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle sign up
                  }
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}