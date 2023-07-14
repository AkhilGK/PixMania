import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/user%20model/usermodel.dart';
import 'package:provider/provider.dart';

class FollowScreen extends StatelessWidget {
  FollowScreen({super.key, required this.isFollowers});
  bool isFollowers;

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserProvider>(context).getUser;
    final followerList = userData.followers;
    final followingList = userData.following;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Name',
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where(
                  'uid',
                  whereIn: isFollowers
                      ? (followerList?.isNotEmpty == true ? followerList : [''])
                      : (followingList?.isNotEmpty == true
                          ? followingList
                          : ['']),
                )
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Text('No followers.');
              }
              final documents = snapshot.data!.docs;
              return Column(
                children: [
                  isFollowers
                      ? const Text(
                          'Followers',
                          style: TextStyle(fontSize: 22),
                        )
                      : const Text(
                          'Following',
                          style: TextStyle(fontSize: 22),
                        ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: documents.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 15),
                        // visualDensity: const VisualDensity(vertical: -4),
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(documents[index]['profileImage']),
                          // AssetImage('assets/logo/camLogo.png'),
                          radius: 35,
                        ),
                        title: Text(
                          documents[index]['userName'],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      )),
    );
  }
}
