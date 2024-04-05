import 'package:accessable/presentation/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Added this line

class CustomerSignUpPage extends StatefulWidget {
  const CustomerSignUpPage({super.key});

  @override
  _CustomerSignUpPageState createState() => _CustomerSignUpPageState();
}

class _CustomerSignUpPageState extends State<CustomerSignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final disabilityController = TextEditingController();
  final countryController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final aboutController = TextEditingController();

  bool _isPasswordVisible = false;
  IconData genderIcon = Icons.transgender;
  String? gender;
  String? disability;
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
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
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: ColorManager.primary),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: ColorManager.primary),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: DropdownButtonFormField<String>(
                value: gender,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  prefixIcon: Icon(genderIcon), // Use the selected icon
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: ColorManager.primary),
                  ),
                ),
                items: <String>['Male', 'Female'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    gender = newValue;
                    // Update the icon based on the selected gender
                    genderIcon = newValue == 'Male' ? Icons.male : Icons.female;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your gender';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  prefixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: ColorManager.primary),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: DropdownButtonFormField<String>(
                value: disability,
                decoration: InputDecoration(
                  labelText: 'Disability',
                  prefixIcon: const Icon(Icons.accessible),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: ColorManager.primary),
                  ),
                ),
                items: <String>[
                  'Spinal Cord Injury',
                  'Paraplegia',
                  'Quadriplegia',
                  'Multiple Sclerosis',
                  'Spina Bifida',
                  'Muscular Dystrophy',
                  'Cerebral Palsy',
                  'Hemiplegia'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    disability = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your disability';
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
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: ColorManager.primary),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
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
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      // Change the icon based on the password visibility
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible =
                            !_isPasswordVisible; // Toggle the password visibility
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: ColorManager.primary),
                  ),
                ),
                obscureText: !_isPasswordVisible,
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
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      // Change the icon based on the password visibility
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible =
                            !_isPasswordVisible; // Toggle the password visibility
                      });
                    },
                  ),
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
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        // If the previous line doesn't throw an error, the user is created
                        // Now, send the email verification
                        await userCredential.user!.sendEmailVerification();
                        // After this line, the verification email is sent to the user

                        // Save the user data to Firestore
                        await _firestore
                            .collection('customers')
                            .doc(userCredential.user!.uid)
                            .set({
                          'firstName': firstNameController.text,
                          'lastName': lastNameController.text,
                          'age': ageController.text,
                          'disability': disabilityController.text,
                          'country': countryController.text,
                          'email': emailController.text,
                          'phone': phoneController.text,
                          'about': aboutController.text,
                          'gender': gender,
                          // ignore: equal_keys_in_map
                          'disability': disability,
                        });

                        // Show a SnackBar with a success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Signed up successfully!')),
                        );

                        Navigator.pushNamed(context, '/main');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
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
                              content:
                                  Text('An error occurred. Please try again.')),
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
    );
  }
}
