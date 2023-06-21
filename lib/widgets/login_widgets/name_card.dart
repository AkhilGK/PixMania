import 'package:flutter/material.dart';

class NameCard extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      // ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.9919250, size.height * 0.1253600);
    path0.quadraticBezierTo(size.width * 0.9922625, size.height * 0.1097800,
        size.width * 0.9832125, size.height * 0.1086400);
    path0.lineTo(size.width * 0.0176125, size.height * 0.1054000);
    path0.quadraticBezierTo(size.width * 0.0071750, size.height * 0.1070800,
        size.width * 0.0087875, size.height * 0.1263600);
    path0.cubicTo(
        size.width * 0.0087719,
        size.height * 0.1612700,
        size.width * 0.0084125,
        size.height * 0.2345000,
        size.width * 0.0087250,
        size.height * 0.2660000);
    path0.quadraticBezierTo(size.width * 0.0088000, size.height * 0.2884000,
        size.width * 0.0188125, size.height * 0.2940200);
    path0.quadraticBezierTo(size.width * 0.8250875, size.height * 0.5310800,
        size.width * 0.9794625, size.height * 0.5865800);
    path0.quadraticBezierTo(size.width * 0.9931625, size.height * 0.5863000,
        size.width * 0.9923625, size.height * 0.5673200);
    path0.quadraticBezierTo(size.width * 0.9922531, size.height * 0.4568300,
        size.width * 0.9919250, size.height * 0.1253600);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
