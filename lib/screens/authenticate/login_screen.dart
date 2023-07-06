import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixmania/widgets/login_widgets/appbar.dart';
import 'package:pixmania/widgets/login_widgets/button.dart';
import 'package:pixmania/widgets/login_widgets/formfield.dart';
import 'package:pixmania/widgets/login_widgets/mail_fb_sign.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/screens/authenticate/forget_password.dart';
import 'package:pixmania/screens/authenticate/sign_up.dart';
import 'package:pixmania/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthServices auth = AuthServices();

  final formkey = GlobalKey<FormState>();
  String error = '';
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

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
          child: Form(
            key: formkey,
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

                      SubmitButton(
                          title: 'Log In', onpressfun: _signInButtonPressed),

                      isLoading
                          ? Text(
                              error,
                              style: const TextStyle(color: Colors.red),
                            )
                          : const CircularProgressIndicator(),
                      kbox10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: const Text(
                              'Forget Password?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 7, 49, 121)),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ForgetPassword(),
                              ));
                            },
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
                          GestureDetector(
                              onTap: () {
                                auth.signInWithGoogle();
                                setState(() {
                                  isLoading = true;
                                });
                              },
                              child: const SignInOptions(
                                  imagePath: 'assets/sign_in/google.png')),
                          const SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ));
                            },
                            child: const SignInOptions(
                                imagePath: 'assets/sign_in/email.png'),
                          ),
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
                                builder: (context) => const SignUp(),
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
      ),
    );
  }

  void _signInButtonPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formkey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = false;
      });

      dynamic result = await auth.logInWithEmailAndPassword(
        userIdController.text.trim(),
        passwordController.text.trim(),
      );

      if (result == null) {
        setState(() {
          error = "Sign In Failed ! Incorrect username or password.";
        });
      } else if (result == 'user-not-found') {
        setState(() {
          error = "Sign In Failed, User not found.";
        });
      } else {
        print("Signed In");
      }

      setState(() {
        isLoading = true;
      });
    }
  }
}
