import 'package:accessable/presentation/color_manager.dart';
import 'package:accessable/shared/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import '../shared/resources/assets_manager.dart';
import 'forget_password_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formkey = GlobalKey<FormState>();
  late String? _email, _password;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
              child: Column(
<<<<<<<<< Temporary merge branch 1
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsManager.signInLogo,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:40.0),
                    child: TextFormField(
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'You must enter your email';
                        }
                        return null;
                      },
                      onChanged: (email) => _email = email,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      // onChanged: (String value) {
                      //   print(value);
                      // },
                      decoration: const InputDecoration(
                        labelText: 'Email ',
                        prefixIcon: Icon(
                          Icons.email_sharp,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:40.0),
                    child: TextFormField(
                      validator: (password) {
                        if (password!.isEmpty) {
                          return 'You must enter your password';
                        }
                        return null;
                      },
                      onChanged: (password) => _password = password,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      // onChanged: (String value) {
                      //   print(value);
                      // },
                      decoration: const InputDecoration(
                        labelText: 'Password ',
                        prefixIcon: Icon(
                          Icons.lock_sharp,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(Icons.remove_red_eye_sharp,color: Colors.black,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: TextButton(
                      child: const Text(
                        'Forget password?',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.of(context).pushNamed(Routes.mainRout);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.maximumBlueGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text('Sign In',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: Row(
                      children: [
                        const Text('Don\'t have an account?'),
                        const SizedBox(width: 2,),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                  )
                ],
              )),
=========
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageAssets.signInLogo,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextFormField(
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'You must enter your email';
                    }
                    return null;
                  },
                  onChanged: (email) => _email = email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  // onChanged: (String value) {
                  //   print(value);
                  // },
                  decoration: const InputDecoration(
                    labelText: 'Email ',
                    prefixIcon: Icon(
                      Icons.email_sharp,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextFormField(
                  validator: (password) {
                    if (password!.isEmpty) {
                      return 'You must enter your password';
                    }
                    return null;
                  },
                  onChanged: (password) => _password = password,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  // onChanged: (String value) {
                  //   print(value);
                  // }
                  obscureText: !_isPasswordVisible,
                  decoration:  InputDecoration(
                    labelText: 'Password ',
                    prefixIcon: const Icon(
                      Icons.lock_sharp,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off, // Change the icon based on the password visibility
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible; // Toggle the password visibility
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                alignment: AlignmentDirectional.bottomEnd,
                child: TextButton(
                  child: const Text(
                    'Forget password?',
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgetPasswordPage(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SizedBox(
                  width: double.infinity, // Add this line
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.of(context).pushNamed(Routes.mainRoute);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.maximumBlueGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 20,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text('Don\'t have an account?'),
                    const SizedBox(
                      width: 2,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              )
            ],
          )),
>>>>>>>>> Temporary merge branch 2
        ),
      ),
    );
  }
}