import 'package:accessable/presentation/color_manager.dart';
import 'package:flutter/material.dart';

class CustomerSignUpPage extends StatefulWidget {
  const CustomerSignUpPage({super.key});

  @override
  _CustomerSignUpPageState createState() => _CustomerSignUpPageState();
}

class _CustomerSignUpPageState extends State<CustomerSignUpPage> {
  final _formKey = GlobalKey<FormState>();

  // Define your text controllers and variables here
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final disabilityController = TextEditingController();
  final countryController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final aboutController = TextEditingController();
  String? gender;

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
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Image.asset('assets/images/accessable_logo_1.png'),
              const SizedBox(height: 35),
              // Add your TextFormFields here
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: ColorManager.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
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
                  value: gender,
                  decoration: InputDecoration(
                    labelText: 'Disability',
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
                      gender = newValue;
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
                  controller: countryController,
                  decoration: InputDecoration(
                    labelText: 'Country',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: ColorManager.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your country';
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
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
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
                  controller: aboutController,
                  decoration: InputDecoration(
                    labelText: 'About',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: ColorManager.primary),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter something about yourself';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, bottom: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle sign up
                        Navigator.pushNamed(context, '/signIn');
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
