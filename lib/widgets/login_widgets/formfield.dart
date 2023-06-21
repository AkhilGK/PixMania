import 'package:flutter/material.dart';

class CustomFormfield extends StatelessWidget {
  const CustomFormfield(
      {super.key,
      required this.controller,
      this.hintText,
      this.label,
      this.obscureText = false});
  final TextEditingController? controller;
  final String? hintText;
  final String? label;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              (obscureText && value.length < 6)) {
            return "Enter a valid ${label!.toLowerCase()}";
          }
          return null;
        },
        controller: controller,
        obscureText: obscureText,
        // keyboardType: TextInputType.number,
        // maxLength: 12,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          hintText: hintText,
          labelText: label,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}
