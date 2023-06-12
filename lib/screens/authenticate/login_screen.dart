import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixmania/basic_widgets/button.dart';
import 'package:pixmania/basic_widgets/formfield.dart';
import 'package:pixmania/basic_widgets/name_logo.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/screens/authenticate/sign_up.dart';
import 'package:pixmania/services/auth.dart';

import '../../basic_widgets/name_card.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/logo/logo_transparent.png"),
        automaticallyImplyLeading: false,
        toolbarHeight: 150,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const Center(child: NamePixmania()),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // NamePixmania(),
                    Text("Let's share the precious moments...",
                        style: GoogleFonts.monoton(fontSize: 16)),
                    kbox30,
                    Row(
                      children: const [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                    kbox20,
                    // ElevatedButton(
                    //     onPressed: () async {
                    //       await auth.logInWithEmailAndPassword(
                    //         userIdController.text.trim(),
                    //         passwordController.text.trim(),
                    //       );
                    //     },
                    //     child: Text("Login")),
                    SubmitButton(
                        title: 'Log In', onpressfun: _signInButtonPressed),
                    kbox10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Forget Password?',
                          style:
                              TextStyle(color: Color.fromARGB(255, 7, 49, 121)),
                        )
                      ],
                    ),
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
                          child: const Icon(Icons.mail),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(Icons.phone),
                        )
                      ],
                    ),
                    kbox30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account "),
                        GestureDetector(
                          child: const Text(
                            'Sign up.',
                            style: TextStyle(
                                color: Color.fromARGB(255, 7, 49, 121)),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signInButtonPressed() async {
    try {
      await auth.logInWithEmailAndPassword(
        userIdController.text.trim(),
        passwordController.text.trim(),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
