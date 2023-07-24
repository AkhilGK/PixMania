import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:pixmania/models/usermodel.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/services/chat_services.dart';
import 'package:pixmania/widgets/chat_widget/chat_bubble.dart';
import 'package:provider/provider.dart';

class Chats extends StatelessWidget {
  Chats({super.key, required this.recieverId, required this.userName});
  TextEditingController chatController = TextEditingController();
  String recieverId;
  String userName;

  @override
  Widget build(BuildContext context) {
    UserData user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('chats')
              .doc(recieverId)
              .collection('messages')
              .orderBy('time', descending: false)
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
                child: Text('Error:${snapshot.error.toString()}'),
              );
            } else {
              final documents = snapshot.data!.docs;
              print(documents.length);
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final chatData = documents[index];
                  // ChatModel chat = ChatModel.fromJson(documents[index]);
                  bool isUserMessage = chatData['receiver'] != user.uid;
                  // return Text(chatData['message']);
                  String formattedTime =
                      DateFormat('hh:mm a').format(chatData['time'].toDate());

                  return ChatBubble(
                      message: chatData['message'],
                      time: formattedTime,
                      isUsersMessage: isUserMessage);
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: // text input
          SafeArea(
        child: Container(
          color: Colors.white,
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    controller: chatController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message ',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: InkWell(
                  child: Row(
                    children: const [Icon(Icons.send)],
                  ),
                  onTap: () async {
                    await ChatService()
                        .sendMessage(user.uid, recieverId, chatController.text);
                    chatController.text = '';
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
