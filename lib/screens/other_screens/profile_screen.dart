import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/screens/other_screens/settings_screen.dart';
import 'package:pixmania/user%20model/usermodel.dart';
import 'package:pixmania/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  AuthServices auth = AuthServices();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // UserData? user = Provider.of<UserProvider>(context).getUser;
    // print(user?.userName);
    // print(user?.profileImage);
    // print(user?.bio);
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          UserData user = UserData.fromSnap(snapshot.data!);
          if (snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          print(user.userName);
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
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(user.profileImage!),
                                radius: 35,
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                ),
                              ))),
                      Expanded(
                        child: Text(
                          user.userName!,
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
                      children: [
                        Text(user.followers!.length.toString()),
                        const Text('Followers')
                      ],
                    ),
                    Column(
                      children: [
                        Text(user.following!.length.toString()),
                        const Text('Following')
                      ],
                    )
                  ],
                ),
                kbox20,
              ],
            ),
          );
        });

    // return Container(
    //   height: MediaQuery.of(context).size.height,
    //   width: MediaQuery.of(context).size.width,
    //   decoration: const BoxDecoration(gradient: gradientColor),
    //   child: Column(
    //     children: [
    //       ProfileCard(name: 'pixmaniaUsr'),
    //       ElevatedButton(
    //           onPressed: (() async {
    //             await auth.signout();
    //           }),
    //           child: const Text("LogOut")),
    //       // Image.network(imagePath)
    //     ],

    //   ),
    // );
  }
}
