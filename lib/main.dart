import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pixmania/screens/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  runApp(const PixMania());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class PixMania extends StatelessWidget {
  const PixMania({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen(),
        theme: ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 221, 247, 236),
            primarySwatch: Colors.green,
            primaryColor: Colors.greenAccent));
  }
}
