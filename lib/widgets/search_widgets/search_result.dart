import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pixmania/user%20model/usermodel.dart';

class SearchResult extends StatelessWidget {
  SearchResult({super.key, required this.query});
  String query;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          Center(
            child: Text('Error:${snapshot.error}'),
          );
        }
        List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
            snapshot.data!.docs;
        final List<UserData> users =
            documents.map((e) => UserData.fromSnap(e)).toList();
        List result = users
            .where((element) => element.userName!
                .trim()
                .toLowerCase()
                .contains(query.toLowerCase().trim()))
            .toList();

        return result.isEmpty
            ? Center(
                child: Lottie.asset('assets/animations/animation_lk7t4l8g.zip'))
            : ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: result
                    .map((user) => Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(user.profileImage),
                                // AssetImage('assets/logo/camLogo.png'),
                                radius: 26,
                              ),
                            ),
                            title: Text(user.userName),
                          ),
                        ))
                    .toList(),
              );
      },
    );
  }
}
