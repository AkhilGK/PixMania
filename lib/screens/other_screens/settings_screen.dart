import 'package:flutter/material.dart';
import 'package:pixmania/basic_widgets/button.dart';
import 'package:pixmania/basic_widgets/colors.dart';
import 'package:pixmania/basic_widgets/formfield.dart';
import 'package:pixmania/services/auth.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  AuthServices auth = AuthServices();
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton.icon(
              label: const Text('Profile'),
              onPressed: () {
                _showAlertDialog(context);
              },
              icon: const Icon(Icons.person)),
          SubmitButton(title: 'Log out', onpressfun: logOut)
        ],
      )),
    );
  }

  void logOut() async {
    await auth.signout();
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: scafoldBg,
          title: const Text('Profile'),
          // content: const Text('dfsaf.'),
          actions: <Widget>[
            Column(
              children: [
                CircleAvatar(
                  radius: 65,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/logo/camLogo.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                ElevatedButton(
                  child: const Text('Change Profile Picture'),
                  onPressed: () {},
                ),
                CustomFormfield(
                    controller: nameController,
                    hintText: 'Enter Username',
                    label: 'Username'),
                CustomFormfield(
                    controller: aboutController,
                    hintText: 'Tell about your self',
                    label: 'About'),
                SubmitButton(
                  title: 'Save Changes',
                  onpressfun: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
