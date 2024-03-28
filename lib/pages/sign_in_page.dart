import 'package:accessable/presentation/color_manager.dart';
import 'package:accessable/shared/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:accessable/shared/resources/assets_manager.dart';
import 'forget_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Scaffold(
        body: Center(
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    ImageAssets.signInLogo,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 60.0),
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
                    decoration: const InputDecoration(
                      labelText: 'Email ',
                      prefixIcon: Icon(
                        Icons.email_sharp,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password ',
                      prefixIcon: const Icon(
                        Icons.lock_sharp,
                        color: Colors.black,
                      ),
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
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                              email: _email!,
                              password: _password!,
                            );
                            // If the previous line doesn't throw an error, the user is signed in
                            Navigator.of(context).pushNamed(Routes.mainRout);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Error'),
                                      content: const Text(
                                          'No user found for that email.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  });
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Error'),
                                      content: const Text(
                                          'Wrong password provided for that user.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  });
                            }
                          } catch (e) {
                            print(e);
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
                        'Sign In',
                        style: TextStyle(
                          fontSize: 20,
                          color: ColorManager.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
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
                          Navigator.pushNamed(context, '/specifyUserPage');
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
