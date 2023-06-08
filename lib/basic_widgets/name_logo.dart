import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NamePixmania extends StatelessWidget {
  const NamePixmania({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Adjust the width as needed
      height: 80, // Adjust the height as needed
      decoration: BoxDecoration(
        // color: Colors.white, // Optional container color
        borderRadius: BorderRadius.circular(10), // Optional border radius
        // boxShadow: [
        //   BoxShadow(
        //     color:
        //         Colors.grey.withOpacity(0.5), // Optional shadow color
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3), // Optional shadow offset
        //   ),
        // ],
      ),
      child: Image.asset(
        'assets/logo/logo_transparent.png', // Replace with your own image path
        fit: BoxFit.cover, // Adjust the fit as needed
      ),
    );
  }
}
