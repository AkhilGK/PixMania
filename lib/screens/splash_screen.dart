import 'package:flutter/material.dart';
import 'package:pixmania/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    goto(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 247, 236),
      body: Center(
        child: Text('splash'),
      ),
    );
  }

  Future goto(BuildContext ctx) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ));
  }
}
