import 'package:flutter/material.dart';

class NamePixmania extends StatelessWidget {
  const NamePixmania({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 75,
      decoration: BoxDecoration(
        // color: Colors.white, // Optional container color
        borderRadius: BorderRadius.circular(10), // Optional border radius
      ),
      child: Image.asset(
        'assets/logo/logo_transparent.png', // Replace with your own image path
        fit: BoxFit.fill, // Adjust the fit as needed
      ),
    );
  }
}
