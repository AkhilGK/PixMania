import 'package:flutter/material.dart';
import 'package:pixmania/screens/authenticate/login_screen.dart';
import 'package:pixmania/screens/home_screen/home_screen.dart';
import 'package:pixmania/user%20model/model.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return const LoginScreen();
    } else {
      return HomeScreen();
    }
  }
}
