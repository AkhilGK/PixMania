import 'package:flutter/material.dart';
import 'package:pixmania/screens/wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    goto(context);
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 247, 236),
      body: Center(
        child: Text('splash'),
      ),
    );
  }

  Future goto(BuildContext ctx) async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (context) => const Wrapper(),
    ));
  }
}
