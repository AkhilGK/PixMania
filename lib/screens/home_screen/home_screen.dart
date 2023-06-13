import 'package:flutter/material.dart';
import 'package:pixmania/services/auth.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
              // child: SubmitButton(
              //     title: 'Log out',
              //     onpressfun: () async {
              //       await auth.signout();
              //     }),
              children: [
            Transform(
              transform: Matrix4.skewX(.7),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue,
                ),
              ),
            ),
            // CustomPaint(
            //   size: Size(
            //       width,
            //       (width * 0.625)
            //           .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //   painter: RPCustomPainter(),
            // ),
            ElevatedButton(
                onPressed: (() async {
                  await auth.signout();
                }),
                child: Text("LogOut")),
            // CustomPaint(
            //   size: Size(width, (width * 0.9).toDouble()),
            //   //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //   painter: NameCard(),
            // ),
          ])),
    );
  }
}

// class NameCard extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       // ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.0;

//     Path path0 = Path();
//     path0.moveTo(size.width * 0.9919250, size.height * 0.1253600);
//     path0.quadraticBezierTo(size.width * 0.9922625, size.height * 0.1097800,
//         size.width * 0.9832125, size.height * 0.1086400);
//     path0.lineTo(size.width * 0.0176125, size.height * 0.1054000);
//     path0.quadraticBezierTo(size.width * 0.0071750, size.height * 0.1070800,
//         size.width * 0.0087875, size.height * 0.1263600);
//     path0.cubicTo(
//         size.width * 0.0087719,
//         size.height * 0.1612700,
//         size.width * 0.0084125,
//         size.height * 0.2345000,
//         size.width * 0.0087250,
//         size.height * 0.2660000);
//     path0.quadraticBezierTo(size.width * 0.0088000, size.height * 0.2884000,
//         size.width * 0.0188125, size.height * 0.2940200);
//     path0.quadraticBezierTo(size.width * 0.8250875, size.height * 0.5310800,
//         size.width * 0.9794625, size.height * 0.5865800);
//     path0.quadraticBezierTo(size.width * 0.9931625, size.height * 0.5863000,
//         size.width * 0.9923625, size.height * 0.5673200);
//     path0.quadraticBezierTo(size.width * 0.9922531, size.height * 0.4568300,
//         size.width * 0.9919250, size.height * 0.1253600);
//     path0.close();

//     canvas.drawPath(path0, paint0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

class RPCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0075000, size.height * 0.2300000);
    path0.quadraticBezierTo(size.width * 0.0084375, size.height * 0.4055000,
        size.width * 0.0087500, size.height * 0.4640000);
    path0.quadraticBezierTo(size.width * 0.0086125, size.height * 0.4835200,
        size.width * 0.0225000, size.height * 0.4840000);
    path0.lineTo(size.width * 0.6087750, size.height * 0.4873200);
    path0.quadraticBezierTo(size.width * 0.6194000, size.height * 0.4862600,
        size.width * 0.6187500, size.height * 0.4680000);
    path0.cubicTo(
        size.width * 0.6185906,
        size.height * 0.4600000,
        size.width * 0.6182719,
        size.height * 0.4440000,
        size.width * 0.6181125,
        size.height * 0.4360000);
    path0.quadraticBezierTo(size.width * 0.6158375, size.height * 0.4297800,
        size.width * 0.6075000, size.height * 0.4260000);
    path0.quadraticBezierTo(size.width * 0.1653000, size.height * 0.2652450,
        size.width * 0.0179000, size.height * 0.2116600);
    path0.quadraticBezierTo(size.width * 0.0081750, size.height * 0.2116800,
        size.width * 0.0075000, size.height * 0.2300000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}








// class RightAngledTrianglePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;

//     final path = Path()
//       ..moveTo(size.width, 0)
//       ..lineTo(size.width, size.height)
//       ..quadraticBezierTo(size.width, size.height, 0, size.height)
//       ..lineTo(size.width, 0)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }




//the good one
// class SlantedCurvedRectangleClipper extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;
//     final double cornerRadius = 20.0;

//     final path = Path()
//       // ..moveTo(0, 0)
//       // ..lineTo(size.width, 0)
//       // ..lineTo(size.width, size.height)
//       // ..lineTo(0, size.height - 80)
//       // ..close();

//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

// class RhomboidPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;

//     final path = Path()
//       ..moveTo(0, size.height / 3)
//       ..lineTo(size.width / 1, 0)
//       ..lineTo(size.width, size.height / 2)
//       ..lineTo(size.width / 2, size.width)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
