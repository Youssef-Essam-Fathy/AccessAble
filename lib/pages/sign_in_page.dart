import 'package:flutter/material.dart';
import '../shared/resources/image_assets.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
              child: Column(
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
              SizedBox(height: 10.0),
              Container(
                alignment: AlignmentDirectional.bottomEnd,
                child: TextButton(
                  child: Text(
                    'Forget password?',
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPasswordPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
