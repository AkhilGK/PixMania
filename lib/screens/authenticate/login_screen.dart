import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixmania/basic_widgets/appbar.dart';
import 'package:pixmania/basic_widgets/button.dart';
import 'package:pixmania/basic_widgets/formfield.dart';
import 'package:pixmania/basic_widgets/mail_fb_sign.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/screens/authenticate/sign_up.dart';
import 'package:pixmania/services/auth.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: const CustomAppbar(),
        title: Image.asset("assets/logo/logo_transparent.png"),
        automaticallyImplyLeading: false,
        toolbarHeight: 130,
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
                            fontSize: 22,
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

                    CustomFormfield(
                      controller: passwordController,
                      label: 'Password',
                      hintText: 'Enter your pasword',
                      obscureText: true,
                    ),

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
                      children: const [
                        SignInOptions(imagePath: 'assets/sign_in/google.png'),
                        SignInOptions(imagePath: 'assets/sign_in/fb_img.png'),
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
