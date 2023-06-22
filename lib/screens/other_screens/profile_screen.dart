import 'package:flutter/material.dart';
import 'package:pixmania/widgets/login_widgets/colors.dart';
import 'package:pixmania/services/auth.dart';
import 'package:pixmania/widgets/profile_widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  AuthServices auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(gradient: gradientColor),
      child: Column(
        children: [
          ProfileCard(
              name: 'Agk_kjhfkadha', profileImage: "assets/logo/camLogo.png"),
          ElevatedButton(
              onPressed: (() async {
                await auth.signout();
              }),
              child: const Text("LogOut")),
        ],
      ),
    );
  }
}
