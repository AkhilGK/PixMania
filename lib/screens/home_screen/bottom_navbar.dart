// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:pixmania/screens/home_screen/home_screen.dart';
// import 'package:pixmania/screens/other_screens/chat_screen.dart';
// import 'package:pixmania/screens/other_screens/home.dart';
// import 'package:pixmania/screens/other_screens/profile_screen.dart';
// import 'package:pixmania/screens/other_screens/search_screen.dart';

// class BottomNav extends StatelessWidget {
//   BottomNav({super.key});
//   final List<Widget> _widgetOptions = <Widget>[
//     const Home(),
//     const SearchScreen(),
//     const ChatScreen(),
//     const ProfileScreen()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//         valueListenable: HomeScreen.selectedBottomNotifier,
//         builder: (ctx, int updatedINdex, _) {
//           return Container(
//             color: const Color.fromARGB(255, 145, 202, 189),
//             child: const Padding(
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//               child: GNav(
//                   padding: EdgeInsets.all(10),
//                   activeColor: Color.fromARGB(255, 207, 238, 230),
//                   gap: 2,
//                   backgroundColor: Color.fromARGB(255, 145, 202, 189),
//                   tabBackgroundColor: Color.fromARGB(255, 99, 116, 112),
//                   tabs: [
//                     GButton(icon: Icons.home, text: "Home"),
//                     GButton(icon: Icons.search, text: "Search"),
//                     // GButton(icon: Icons.add, text: "Add"),
//                     GButton(icon: Icons.chat, text: "Chat"),
//                     GButton(icon: Icons.person, text: "Profile")
//                   ]),
//             ),
//           );
//         });
//   }
// }
