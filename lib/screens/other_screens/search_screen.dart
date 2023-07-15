import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixmania/constants/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: kboxDecoration,
      child: Column(
        children: [
          CupertinoSearchTextField(
            padding: const EdgeInsets.all(15),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: const TextStyle(color: Colors.black),
            backgroundColor: Colors.white.withOpacity(0.8),
            onTap: () {},
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
