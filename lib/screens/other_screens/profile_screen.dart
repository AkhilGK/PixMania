import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/services/auth.dart';
import 'package:pixmania/widgets/profile_widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });

  AuthServices auth = AuthServices();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // List<String> imagePaths = [
  //   'assets/posts/275933.jpg',
  //   'assets/posts/sd.jpg',
  //   'assets/posts/thumbbig-147879.webp'
  // ];

  @override
  Widget build(BuildContext context) {
    String currentUser = _auth.currentUser!.uid;

    return Container(
      decoration: kboxDecoration,
      child: Column(
        children: [
          ProfileCard(),
          kbox10,
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('posts')
                    .where('uid', isEqualTo: currentUser)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Error:${snapshot.error.toString()}'));
                  } else {
                    final documents = snapshot.data!.docs;

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Post user = Post.fromSnap(documents[index]);
                        return Container(
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
                        );
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
      // child: SingleChildScrollView(
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: GridView.builder(
      //             shrinkWrap: true,
      //             physics: const NeverScrollableScrollPhysics(),
      //             itemCount: imagePaths.length,
      //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 3,
      //               crossAxisSpacing: 10.0,
      //               mainAxisSpacing: 10.0,
      //             ),
      //             itemBuilder: (BuildContext context, int index) {
      //               return Container(
      //                 decoration: BoxDecoration(
      //                   border: Border.all(),
      //                   borderRadius: BorderRadius.circular(5),
      //                 ),
      //                 child: Image.asset(
      //                   imagePaths[index],
      //                   fit: BoxFit.cover,
      //                 ),
      //               );
      //             },
      //           ),
      //         ),
      //       ),