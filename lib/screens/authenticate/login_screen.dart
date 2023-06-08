import 'package:flutter/material.dart';
import 'package:pixmania/basic_widgets/button.dart';
import 'package:pixmania/basic_widgets/formfield.dart';
import 'package:pixmania/basic_widgets/name_logo.dart';
import 'package:pixmania/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController userIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: NamePixmania()),
                Text("Let's share the precious moments"),
                Row(
                  children: [
                    Text(
                      'Login',
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
                  controller: userIdController,
                  label: 'Password',
                  hintText: 'Enter your pasword',
                ),
                kbox30,
                kbox30,
                SubmitButton(title: 'Log In', function: dummy),
                kbox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Forget Password?',
                      style: TextStyle(color: Color.fromARGB(255, 7, 49, 121)),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Don't have an account "),
                    Text(
                      'Sign up.',
                      style: TextStyle(color: Color.fromARGB(255, 7, 49, 121)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dummy() {
    print('logged in');
  }
}
