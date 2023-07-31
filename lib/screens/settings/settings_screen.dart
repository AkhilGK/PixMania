import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/screens/settings/edit_profile.dart';
import 'package:pixmania/services/auth.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  AuthServices auth = AuthServices();

  FirebaseAuth user = FirebaseAuth.instance;

  // Uint8List? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Container(
          decoration: kboxDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                // style: ButtonStyle(
                //   side: MaterialStateProperty.all(
                //     const BorderSide(width: 1.0, color: Colors.black),
                //   ),
                // ),
                label: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EditProfile(),
                  ));
                },
                icon: const Icon(Icons.person),
              ),
              const Divider(),
              TextButton.icon(
                label: const Text(
                  'About Us',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {},
                icon: const Icon(Icons.info),
              ),
              const Divider(),
              TextButton.icon(
                label: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType
                        .warning, // Change it as per your requirements
                    animType: AnimType.scale,
                    title: 'Log out?',
                    desc: 'Log out from this User',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () async {
                      logOut();
                    },
                  ).show();
                },
                icon: const Icon(Icons.logout),
              ),
              const Divider(),
              TextButton.icon(
                label: const Text(
                  'Delete Account',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {},
                icon: const Icon(Icons.delete_forever_outlined),
              ),
              const Divider(),
              TextButton.icon(
                label: const Text(
                  'Customer Care',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType
                        .infoReverse, // Change it as per your requirements
                    animType: AnimType.scale,
                    title: 'Mail Us',
                    desc: 'Press ok to email us ',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () async {
                      launchUrlString('mailto:nanohardbro@gmail.com');
                    },
                  ).show();
                },
                icon: const Icon(Icons.call),
              ),
              const Divider(),
              TextButton.icon(
                label: const Text(
                  'Share',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {},
                icon: const Icon(Icons.share),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logOut() async {
    await auth.signout();
  }
}
