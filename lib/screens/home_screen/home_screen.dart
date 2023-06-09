import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pixmania/basic_widgets/button.dart';
import 'package:pixmania/services/auth.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  AuthServices auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        // child: SubmitButton(
        //     title: 'Log out',
        //     onpressfun: () async {
        //       await auth.signout();
        //     }),
        child: ElevatedButton(
            onPressed: (() async {
              await auth.signout();
            }),
            child: Text("LogOut")),
      )),
    );
  }
}
