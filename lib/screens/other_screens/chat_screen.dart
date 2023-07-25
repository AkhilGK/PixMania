import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/screens/other_screens/chats.dart';
import 'package:pixmania/services/auth.dart';
import 'package:pixmania/models/usermodel.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    UserData user = Provider.of<UserProvider>(context).getUser;
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: kboxDecoration,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      user.userName!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(user.profileImage!),
                  ),
                )
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .collection('chats')
                  .orderBy('time', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitWaveSpinner(
                      size: 80,
                      color: Colors.teal,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error:${snapshot.error}'),
                  );
                }
                final documents = snapshot.data?.docs;

                return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .snapshots(),
                    builder: (context, userSnapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: SpinKitWaveSpinner(
                            size: 80,
                            color: Colors.teal,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error:${snapshot.error}'),
                        );
                      } else {
                        final userList = userSnapshot.data?.docs;

                        return
                            //  filteredList.isEmpty
                            //     ? const Text('No chats')
                            //     :
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: documents!.length,
                                itemBuilder: (context, index) {
                                  final messageData = documents[index];
                                  QueryDocumentSnapshot<Map<String, dynamic>>
                                      docData = documents[index];
                                  for (final doc in userList!) {
                                    if (doc['uid'] ==
                                        messageData['receiverId']) {
                                      docData = doc;
                                    }
                                  }
                                  // final docData = filteredList[index].data();
                                  // final userdata = usersMessaged[index].data();
                                  String formattedTime = DateFormat('hh:mm a')
                                      .format(messageData['time'].toDate());
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      // visualDensity: const VisualDensity(vertical: -4),
                                      leading: CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Colors.black,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              docData['profileImage']),
                                          // AssetImage('assets/logo/camLogo.png'),
                                          radius: 26,
                                        ),
                                      ),
                                      title: Text(docData['userName']),
                                      subtitle: Text(
                                        documents[index]['lastMessage'],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: Text(formattedTime),
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => Chats(
                                              recieverId: docData['uid'],
                                              userName: docData['userName']),
                                        ));
                                      },
                                    ),
                                  );
                                });
                      }
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
