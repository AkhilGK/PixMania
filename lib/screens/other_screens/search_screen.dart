import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double height = 100.0;

  double width = 100.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (() {
            setState(() {
              height = 300;
              width = 300;
            });
          }),
          child: AnimatedContainer(
            color: Colors.black87,
            height: height,
            width: width,
            duration: const Duration(
              seconds: 1,
            ),
            onEnd: () {
              setState(() {
                height = 100;
                width = 100;
              });
            },
          ),
        ),
        Container(
          child: const Center(
            child: Text('Search'),
          ),
        ),
      ],
    );
  }
}
