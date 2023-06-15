import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pixmania/basic_widgets/name_logo.dart';
import 'package:pixmania/screens/wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: const NamePixmania(), nextScreen: const Wrapper());
  }
}
