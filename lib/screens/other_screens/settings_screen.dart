import 'package:flutter/material.dart';
import 'package:pixmania/basic_widgets/button.dart';
import 'package:pixmania/services/auth.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [SubmitButton(title: 'Log out', onpressfun: logOut)],
      )),
    );
  }

  void logOut() async {
    await auth.signout();
  }
}
