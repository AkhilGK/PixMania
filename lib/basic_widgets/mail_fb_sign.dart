import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignInOptions extends StatelessWidget {
  const SignInOptions({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Image.asset(imagePath),
      radius: 15,
    );
  }
}
