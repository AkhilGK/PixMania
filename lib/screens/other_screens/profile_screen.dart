import 'package:flutter/material.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/user%20model/usermodel.dart';
import 'package:pixmania/widgets/login_widgets/colors.dart';
import 'package:pixmania/services/auth.dart';
import 'package:pixmania/widgets/profile_widgets/profile_card.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  AuthServices auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    UserData user = Provider.of<UserProvider>(context).getUser;
    print(user.userName);
    print(user.profileImage);
    print(user.bio);

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(gradient: gradientColor),
      child: Column(
        children: [
          ProfileCard(name: user.userName, profileImage: user.profileImage),
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
