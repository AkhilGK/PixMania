import 'package:flutter/material.dart';
import 'package:pixmania/models/usermodel.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/services/firestore.dart';
import 'package:provider/provider.dart';

class Chats extends StatelessWidget {
  Chats({super.key, required this.recieverId});
  TextEditingController chatController = TextEditingController();
  String recieverId;

  @override
  Widget build(BuildContext context) {
    UserData user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserName'),
      ),
      body: StreamBuilder(
        stream: null,
        builder: (context, snapshot) {
          return const Text('message');
        },
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
                    await FireStore()
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
