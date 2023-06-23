import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/screens/other_screens/settings_screen.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({super.key, this.name, this.profileImage});
  Uint8List? profileImage;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: Colors.white70,
      // elevation: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          "assets/logo/camLogo.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                    // : CircleAvatar(
                    //     backgroundImage: MemoryImage(
                    //         Uint8List.fromList(utf8.encode(profileImage))),
                    //     radius: 35,
                    //     child: const Padding(
                    //       padding: EdgeInsets.all(5.0),
                    //       // child: Image.asset(
                    //       //   profileImage,
                    //       //   fit: BoxFit.fill,
                    //       // ),
                    //     ),
                    //   )
                    ),
                Expanded(
                  child: Text(
                    name!,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SettingScreen(),
                      ));
                    },
                    child: const Icon(Icons.edit)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [Text('2000'), Text('Followers')],
              ),
              Column(
                children: const [Text('1908'), Text('Following')],
              )
            ],
          ),
          kbox20,
        ],
      ),
    );
  }
}
