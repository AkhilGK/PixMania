import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pixmania/screens/other_screens/chat_screen.dart';
import 'package:pixmania/screens/other_screens/home.dart';
import 'package:pixmania/screens/other_screens/profile_screen.dart';
import 'package:pixmania/screens/other_screens/search_screen.dart';
import 'package:pixmania/services/auth.dart';

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
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: HomeScreen.selectedBottomNotifier,
          builder: (ctx, int updatedINdex, _) {
            return Container(
              color: const Color.fromARGB(255, 145, 202, 189),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: GNav(
                    selectedIndex: updatedINdex,
                    onTabChange: (value) {
                      selectedBottomNotifier.value = value;
                    },
                    padding: const EdgeInsets.all(10),
                    activeColor: const Color.fromARGB(255, 207, 238, 230),
                    gap: 2,
                    backgroundColor: const Color.fromARGB(255, 145, 202, 189),
                    tabBackgroundColor: const Color.fromARGB(255, 99, 116, 112),
                    tabs: const [
                      GButton(icon: Icons.home, text: "Home"),
                      GButton(icon: Icons.search, text: "Search"),
                      // GButton(icon: Icons.add, text: "Add"),
                      GButton(icon: Icons.chat, text: "Chat"),
                      GButton(icon: Icons.person, text: "Profile")
                    ]),
              ),
            );
          }),
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 145, 202, 189),
      //   toolbarHeight: 50,
      //   title: const NamePixmania(), centerTitle: true,
      //   // actions: const [NamePixmania()],
      // ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedBottomNotifier,
          builder: (context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
        // child: Column(children: [
        //   // Transform(
        //   //   transform: Matrix4.skewX(.7),
        //   //   child: Container(
        //   //     width: double.infinity,
        //   //     height: 200,
        //   //     decoration: BoxDecoration(
        //   //       borderRadius: BorderRadius.circular(50),
        //   //       color: Colors.blue,
        //   //     ),
        //   //   ),
        //   // ),
        //   ElevatedButton(
        //       onPressed: (() async {
        //         await auth.signout();
        //       }),
        //       child: const Text("LogOut")),
        // ]),
      ),
    );
  }
}
