// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/screens/other_screens/posts_inprofile.dart';
import 'package:pixmania/services/firestore.dart';
import 'package:pixmania/user%20model/usermodel.dart';
import 'package:provider/provider.dart';

class VisitProfile extends StatelessWidget {
  VisitProfile({super.key, required this.snap});
  final snap;
  bool isfollowing = false;

  // String uid;
  // String name;

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserProvider>(context).getUser;
    ValueNotifier followNotify = ValueNotifier(userData.following);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(snap['uid'])
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error.toString()}'),
                );
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const Center(child: Text('No data found'));
              } else {
                final user = snapshot.data!.data();
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      kbox10,
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 46.5,
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage:
                                    NetworkImage(user!['profileImage']),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                user['userName'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(user['bio']),
                            ],
                          ),
                        ],
                      ),
                      kbox10,
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(user['followers'].length.toString()),
                                const Text(
                                  'Followers',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const VerticalDivider(
                              thickness: 2,
                              color: Colors.grey,
                              width: 2,
                            ),
                            Column(
                              children: [
                                Text(user['following'].length.toString()),
                                const Text(
                                  'Following',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: followNotify,
                        builder: (context, value, child) {
                          if (followNotify.value.contains(snap['uid'])) {
                            return ElevatedButton(
                              onPressed: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType
                                      .warning, // Change it as per your requirements
                                  animType: AnimType.scale,
                                  title: 'Delete post?',
                                  desc: 'The post will be deleted',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () async {
                                    await FireStore()
                                        .unFollow(userData.uid, snap['uid']);
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .refreshUser();
                                  },
                                ).show();
                              },
                              child: const Text('Following'),
                            );
                          } else {
                            return ElevatedButton(
                              onPressed: () async {
                                await FireStore()
                                    .follow(userData.uid, snap['uid']);
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .refreshUser();
                              },
                              child: const Text('Follow'),
                            );
                          }
                        },
                      ),
                      // isfollowing
                      //     ? ElevatedButton(
                      //         onPressed: () {},
                      //         child: const Text('Following'),
                      //       )
                      //     : ElevatedButton(
                      //         onPressed: () {},
                      //         child: const Text('Follow'),
                      //       ),
                    ],
                  ),
                );
              }
            },
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(20),
          //         bottomRight: Radius.circular(20)),
          //     color: Colors.white,
          //   ),
          //   margin: const EdgeInsets.all(0),
          //   child: Column(
          //     children: [
          //       kbox10,
          //       Text(
          //         snap['userName'],
          //         style: const TextStyle(
          //             fontSize: 20, fontWeight: FontWeight.bold),
          //       ),
          //       // Text(snap['descri']),
          //       CircleAvatar(
          //         radius: 50,
          //         backgroundImage: NetworkImage(snap['profileImage']),
          //       ),
          //       isfollowing
          //           ? ElevatedButton(
          //               onPressed: () {}, child: const Text('Following'))
          //           : ElevatedButton(
          //               onPressed: () {}, child: const Text('Follow'))
          //     ],
          //   ),
          // ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('posts')
                    .where('uid', isEqualTo: snap['uid'])
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Error:${snapshot.error.toString()}'));
                  } else {
                    final documents = snapshot.data!.docs;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          // Post user = Post.fromSnap(documents[index]);
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ViewPost(snap: documents[index]),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          documents[index].data()['postUrl']))),
                              // child: Image.network(
                              //   documents[index].data()['postUrl'],
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
          ),
        ],
      )),
    );
  }
}
