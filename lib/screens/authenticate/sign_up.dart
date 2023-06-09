import 'package:flutter/material.dart';
import 'package:pixmania/basic_widgets/button.dart';
import 'package:pixmania/basic_widgets/formfield.dart';
import 'package:pixmania/basic_widgets/name_logo.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/services/auth.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController userIdController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String error = '';

  AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: NamePixmania()),
                  Text("Let's share the precious moments"),
                  Row(
                    children: [
                      Text(
                        'Sign Up',
                      ),
                    ],
                  ),
                  kbox20,
                  CustomFormfield(
                    controller: userIdController,
                    label: 'E-mail',
                    hintText: 'Enter your usermail',
                  ),
                  kbox20,
                  CustomFormfield(
                    controller: passwordController,
                    label: 'Password',
                    hintText: 'Enter your pasword',
                    obscureText: true,
                  ),
                  kbox30,
                  kbox30,

                  // ElevatedButton(
                  //     onPressed: _registerButtonPressed,
                  //     child: Text("Register")),
                  SubmitButton(
                      title: 'Register', onpressfun: _registerButtonPressed),
                  Text(error),
                  kbox10,
                  kbox30,
                  kbox20,
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Text("  OR  "),
                      Expanded(
                          child: Divider(
                        thickness: 1,
                      ))
                    ],
                  ),
                  kbox30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(Icons.mail),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(Icons.phone),
                      )
                    ],
                  ),
                  kbox30,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _registerButtonPressed() async {
    if (formkey.currentState?.validate() ?? false) {
      dynamic result = await auth.registerWithEmailAndPAssword(
        userIdController.text.trim(),
        passwordController.text.trim(),
      );

      if (result == null) {
        setState(() {
          error = 'Invalid email';
        });
      } else if (result == 'email-already-in-use') {
        setState(() {
          error = 'User already exists, Please sign In ';
        });
      } else {
        print('Registered');
        Navigator.pop(context);
      }
    }
  }
}
