import 'package:flutter/material.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/services/firestore.dart';
import 'package:pixmania/user%20model/usermodel.dart';
import 'package:pixmania/widgets/homescreen_widgets/comment_card.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatelessWidget {
  CommentScreen({super.key});
final snap;
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    UserData user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Comments'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const CommentCard(),
      ),

      // text input
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.white,
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.profileImage!),
                radius: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Comment as ${user.userName}',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: InkWell(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: const Text(
                          'Post',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      const Icon(Icons.send)
                    ],
                  ),
                  onTap: () {
                    FireStore().commentPost(user.userName!, commentController.text, user.uid!, user.profileImage!, )
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
