import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

const kbox10 = SizedBox(height: 10);
const kbox20 = SizedBox(height: 20);
const kbox30 = SizedBox(height: 30);
const kbaseColor = Color.fromARGB(255, 16, 133, 104);
// const kheight = MediaQuery.of(context).size;
const kboxDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color.fromARGB(255, 196, 212, 208),
        Color.fromARGB(255, 134, 233, 187),
      ]),
);
TextStyle headingStyle = GoogleFonts.monoton(fontSize: 20);
