import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/screens/other_screens/chat_screen.dart';
import 'package:pixmania/screens/other_screens/home.dart';
import 'package:pixmania/screens/other_screens/profile_screen.dart';
import 'package:pixmania/screens/other_screens/search_screen.dart';
import 'package:pixmania/services/auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static ValueNotifier<int> selectedBottomNotifier = ValueNotifier(0);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthServices auth = AuthServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  final _pages = [
    Home(),
    const SearchScreen(),
    const ChatScreen(),
    ProfileScreen()
  ];

  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.black87,
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: HomeScreen.selectedBottomNotifier,
          builder: (ctx, int updatedINdex, _) {
            return Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: GNav(
                    selectedIndex: updatedINdex,
                    onTabChange: (value) {
                      HomeScreen.selectedBottomNotifier.value = value;
                    },
                    padding: const EdgeInsets.all(10),
                    activeColor: const Color.fromARGB(255, 207, 238, 230),
                    gap: 2,
                    backgroundColor: Colors.white,
                    tabBackgroundColor: const Color.fromARGB(255, 99, 116, 112),
                    //const Color.fromARGB(255, 145, 202, 189)
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
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: HomeScreen.selectedBottomNotifier,
          builder: (context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
    );
  }
}
