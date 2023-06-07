import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.title, required this.function});
  final String title;
  final Function function;
  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //   style: ButtonStyle(),
    //   onPressed: () => function,
    //   child: Text(title),
    // );
    return Container(
      width: 140, // Adjust the width as needed
      height: 40, // Adjust the height as needed
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 21, 116, 45),
            Color.fromARGB(255, 6, 156, 94),
            // Color.fromARGB(255, 21, 116, 45),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius:
            BorderRadius.circular(10), // Adjust the border radius as needed
      ),
      child: ElevatedButton(
          onPressed: () => function,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(0, 109, 105,
                105), // Set the button's background color to transparent
            elevation: 0, // Remove any shadow or elevation
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 240, 236, 236),
              fontSize: 18,
            ),
          )),
    );
  }
}
