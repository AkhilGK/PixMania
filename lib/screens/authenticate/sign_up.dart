import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixmania/widgets/login_widgets/appbar.dart';
import 'package:pixmania/widgets/login_widgets/button.dart';
import 'package:pixmania/widgets/login_widgets/formfield.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController userIdController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  String error = '';

  AuthServices auth = AuthServices();
  bool isLoading = true;

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
                  CustomFormfield(
                    controller: confirmController,
                    label: 'Confirm Password',
                    hintText: 'Confirm pasword',
                    obscureText: true,
                  ),
                  SubmitButton(
                      title: 'Register', onpressfun: _registerButtonPressed),
                  isLoading
                      ? Text(
                          error,
                          style: const TextStyle(color: Colors.red),
                        )
                      : const CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _registerButtonPressed() async {
    if (passwordController.text != confirmController.text) {
      setState(() {
        error = "Password doesn't match";
        return;
      });
    } else if (formkey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = false;
      });
      dynamic result = await auth.registerWithEmailAndPAssword(
        userIdController.text.trim(),
        passwordController.text.trim(),
      );

      if (result == null) {
        setState(() {
          isLoading = true;
          error = 'Invalid email';
        });
      } else if (result == 'email-already-in-use') {
        setState(() {
          isLoading = true;
          error = 'User already exists, Please sign In ';
        });
      } else {
        print('Registered');
        Navigator.pop(context);
      }
    }
  }
}
