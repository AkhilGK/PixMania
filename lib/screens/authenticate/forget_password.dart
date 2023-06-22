import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixmania/widgets/login_widgets/appbar.dart';
import 'package:pixmania/widgets/login_widgets/button.dart';
import 'package:pixmania/widgets/login_widgets/formfield.dart';
import 'package:pixmania/constants/constants.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  final TextEditingController userIdController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String error = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;
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
                        'Reset password',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  kbox20,
                  CustomFormfield(
                    controller: userIdController,
                    label: 'E-mail',
                    hintText: 'Enter your E-mail',
                  ),
                  SubmitButton(
                      title: 'Send reset mail',
                      onpressfun: () => resetPassword(context)),
                  Text(error),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void resetPassword(BuildContext context) async {
    if (formkey.currentState?.validate() ?? false) {
      try {
        await _auth.sendPasswordResetEmail(email: userIdController.text.trim());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password reset email sent.'),
            duration: Duration(seconds: 3),
          ),
        );
        Navigator.of(context).pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to send reset email. Please try again.'),
            duration: Duration(seconds: 3),
          ),
        );
        print(e.toString());
      }
    }
  }
}
