import 'package:accessable/presentation/color_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CompanySignUp extends StatefulWidget {
  const CompanySignUp({super.key});

  @override
  _CompanySignUpState createState() => _CompanySignUpState();
}

class _CompanySignUpState extends State<CompanySignUp> {
  final _formKey = GlobalKey<FormState>();

  final companyNameController = TextEditingController();
  final serviceTypeController = TextEditingController();
  final countryController = TextEditingController();
  final businessEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final aboutController = TextEditingController();

  String? gender;
  String? serviceType;
  String? country;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // List of Arabic countries and their phone codes
  final Map<String, String> countries = {
    'Algeria': '+213',
    'Bahrain': '+973',
    'Comoros': '+269',
    'Djibouti': '+253',
    'Egypt': '+20',
    'Iraq': '+964',
    'Jordan': '+962',
    'Kuwait': '+965',
    'Lebanon': '+961',
    'Libya': '+218',
    'Mauritania': '+222',
    'Morocco': '+212',
    'Oman': '+968',
    'Palestine': '+970',
    'Qatar': '+974',
    'Saudi Arabia': '+966',
    'Somalia': '+252',
    'Sudan': '+249',
    'Syria': '+963',
    'Tunisia': '+216',
    'United Arab Emirates': '+971',
    'Yemen': '+967',
  };

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
            icon: Icon(Icons.arrow_back_ios_sharp,
                color: ColorManager.stormCloud),
          ),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Image.asset('assets/images/accessable_logo_1.png'),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: TextFormField(
                  controller: companyNameController,
                  decoration: InputDecoration(
                    labelText: 'Company Name',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: ColorManager.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Company Name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: DropdownButtonFormField<String>(
                  value: serviceType,
                  decoration: InputDecoration(
                    labelText: 'service type',
                    prefixIcon: const Icon(Icons.work),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: ColorManager.primary),
                    ),
                  ),
                  items: <String>[
                    'transportation provider',
                    'jop provider',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      serviceType = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your service type';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: DropdownButtonFormField<String>(
                  value: country,
                  decoration: InputDecoration(
                    labelText: 'Country',
                    prefixIcon: const Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: ColorManager.primary),
                    ),
                  ),
                  items: countries.keys.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      country = newValue;
                      phoneController.text = countries[newValue] ?? '';
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your country';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    prefixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: ColorManager.primary),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: TextFormField(
                  controller: businessEmailController,
                  decoration: InputDecoration(
                    labelText: 'Business Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: ColorManager.primary),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your business email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: ColorManager.primary),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: ColorManager.primary),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: TextFormField(
                  controller: aboutController,
                  decoration: InputDecoration(
                    labelText: 'About',
                    prefixIcon: const Icon(Icons.info),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: ColorManager.primary),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, bottom: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                            email: businessEmailController.text,
                            password: passwordController.text,
                          );
                          // If the previous line doesn't throw an error, the user is created
                          // Now, send the email verification
                          await userCredential.user!.sendEmailVerification();
                          // After this line, the verification email is sent to the user

                          // Save the user data to Firestore
                          await _firestore
                              .collection('business_companies')
                              .doc(userCredential.user!.uid)
                              .set({
                            'firstName': companyNameController.text,
                            'disability': serviceTypeController.text,
                            'country': countryController.text,
                            'email': businessEmailController.text,
                            'phone': phoneController.text,
                            'about': aboutController.text,
                            'gender': gender,
                            'serviceType': serviceType,
                          });

                          // Show a SnackBar with a success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Signed up successfully!')),
                          );

                          Navigator.pushNamed(context, '/main');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');

                            // Show a SnackBar with an error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'The account already exists for that email.')),
                            );
                          }
                        } catch (e) {
                          print(e);

                          // Show a SnackBar with an error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'An error occurred. Please try again.')),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.maximumBlueGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
