import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pixmania/screens/other_screens/chat_screen.dart';
import 'package:pixmania/screens/other_screens/home.dart';
import 'package:pixmania/screens/other_screens/profile_screen.dart';
import 'package:pixmania/screens/other_screens/search_screen.dart';
import 'package:pixmania/services/auth.dart';

import '../../basic_widgets/name_logo.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  AuthServices auth = AuthServices();
  static ValueNotifier<int> selectedBottomNotifier = ValueNotifier(0);
  final _pages = [
    const Home(),
    const SearchScreen(),
    const ChatScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 145, 202, 189),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: GNav(
              padding: EdgeInsets.all(10),
              activeColor: Color.fromARGB(255, 207, 238, 230),
              gap: 2,
              backgroundColor: Color.fromARGB(255, 145, 202, 189),
              tabBackgroundColor: Color.fromARGB(255, 99, 116, 112),
              tabs: [
                GButton(icon: Icons.home, text: "Home"),
                GButton(icon: Icons.search, text: "Search"),
                // GButton(icon: Icons.add, text: "Add"),
                GButton(icon: Icons.chat, text: "Chat"),
                GButton(icon: Icons.person, text: "Profile")
              ]),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 145, 202, 189),
        toolbarHeight: 50,
        title: const NamePixmania(), centerTitle: true,
        // actions: const [NamePixmania()],
      ),
      body: SafeArea(
        // child: ValueListenableBuilder(
        //   valueListenable: selectedBottomNotifier,
        //   builder: (context, int updatedIndex, _) {
        //     return _pages[updatedIndex];
        //   },
        // ),
        child: Column(children: [
          // Transform(
          //   transform: Matrix4.skewX(.7),
          //   child: Container(
          //     width: double.infinity,
          //     height: 200,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(50),
          //       color: Colors.blue,
          //     ),
          //   ),
          // ),
          ElevatedButton(
              onPressed: (() async {
                await auth.signout();
              }),
              child: const Text("LogOut")),
        ]),
      ),
    );
  }
}



// class RPCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.0;

//     Path path0 = Path();
//     path0.moveTo(size.width * 0.0075000, size.height * 0.2300000);
//     path0.quadraticBezierTo(size.width * 0.0084375, size.height * 0.4055000,
//         size.width * 0.0087500, size.height * 0.4640000);
//     path0.quadraticBezierTo(size.width * 0.0086125, size.height * 0.4835200,
//         size.width * 0.0225000, size.height * 0.4840000);
//     path0.lineTo(size.width * 0.6087750, size.height * 0.4873200);
//     path0.quadraticBezierTo(size.width * 0.6194000, size.height * 0.4862600,
//         size.width * 0.6187500, size.height * 0.4680000);
//     path0.cubicTo(
//         size.width * 0.6185906,
//         size.height * 0.4600000,
//         size.width * 0.6182719,
//         size.height * 0.4440000,
//         size.width * 0.6181125,
//         size.height * 0.4360000);
//     path0.quadraticBezierTo(size.width * 0.6158375, size.height * 0.4297800,
//         size.width * 0.6075000, size.height * 0.4260000);
//     path0.quadraticBezierTo(size.width * 0.1653000, size.height * 0.2652450,
//         size.width * 0.0179000, size.height * 0.2116600);
//     path0.quadraticBezierTo(size.width * 0.0081750, size.height * 0.2116800,
//         size.width * 0.0075000, size.height * 0.2300000);
//     path0.close();

//     canvas.drawPath(path0, paint0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }








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
