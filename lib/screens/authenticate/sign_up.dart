import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixmania/basic_widgets/appbar.dart';
import 'package:pixmania/basic_widgets/button.dart';
import 'package:pixmania/basic_widgets/formfield.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: const CustomAppbar(),
        title: Image.asset("assets/logo/logo_transparent.png"),
        automaticallyImplyLeading: false,
        toolbarHeight: 130,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Let's share the precious moments...",
                      style: GoogleFonts.monoton(fontSize: 16)),
                  kbox20,
                  Row(
                    children: const [
                      Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  kbox20,
                  CustomFormfield(
                    controller: userIdController,
                    label: 'E-mail',
                    hintText: 'Enter your usermail',
                  ),
                  CustomFormfield(
                    controller: passwordController,
                    label: 'Password',
                    hintText: 'Enter your pasword',
                    obscureText: true,
                  ),
                  SubmitButton(
                      title: 'Register', onpressfun: _registerButtonPressed),
                  Text(error),
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
