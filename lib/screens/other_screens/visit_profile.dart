import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/screens/other_screens/posts_inprofile.dart';

class VisitProfile extends StatelessWidget {
  VisitProfile({super.key, required this.snap});
  final snap;
  bool isfollowing = true;
  // String uid;
  // String name;

  @override
  Widget build(BuildContext context) {
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
                      Text(
                        user!['userName'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(user['profileImage']),
                      ),
                      Text(user['bio']),
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
                      isfollowing
                          ? ElevatedButton(
                              onPressed: () {},
                              child: const Text('Following'),
                            )
                          : ElevatedButton(
                              onPressed: () {},
                              child: const Text('Follow'),
                            ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
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
