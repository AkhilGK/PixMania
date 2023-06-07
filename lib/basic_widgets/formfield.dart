import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomFormfield extends StatelessWidget {
  CustomFormfield(
      {super.key, required this.controller, this.hintText, this.label});
  final TextEditingController? controller;
  final String? hintText;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        // keyboardType: TextInputType.number,
        // maxLength: 12,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: hintText,
            labelText: label,
            disabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),

        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return ' Amount is Required';
        //   } else {
        //     return null;
        //   }
        // },
      ),
    );
  }
}
