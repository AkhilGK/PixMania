// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:pixmania/screens/home_screen/home_screen.dart';

// class BottomNav extends StatelessWidget {
//   const BottomNav({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(valueListenable: HomeScreen.selectedBottomNotifier, builder: (ctx, int updatedINdex, _) {
//       return  bottomNavigationBar: Container(
//         color: const Color.fromARGB(255, 145, 202, 189),
//         child: const Padding(
//           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: GNav(
//               padding: EdgeInsets.all(10),
//               activeColor: Color.fromARGB(255, 207, 238, 230),
//               gap: 2,
//               backgroundColor: Color.fromARGB(255, 145, 202, 189),
//               tabBackgroundColor: Color.fromARGB(255, 99, 116, 112),
//               tabs: [
//                 GButton(icon: Icons.home, text: "Home"),
//                 GButton(icon: Icons.search, text: "Search"),
//                 // GButton(icon: Icons.add, text: "Add"),
//                 GButton(icon: Icons.chat, text: "Chat"),
//                 GButton(icon: Icons.person, text: "Profile")
//               ]),
//         ),
//       );
      
//     });
//   }
// }
