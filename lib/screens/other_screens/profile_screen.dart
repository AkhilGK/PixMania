import 'package:flutter/material.dart';
import 'package:pixmania/basic_widgets/colors.dart';
import 'package:pixmania/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  AuthServices auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(gradient: gradientColor),
        child: Center(
            child: ElevatedButton(
                onPressed: (() async {
                  await auth.signout();
                }),
                child: const Text("LogOut"))),
      ),
    );
  }
}
