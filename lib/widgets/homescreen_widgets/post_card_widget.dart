import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/screens/other_screens/comment_screen.dart';
import 'package:pixmania/services/firestore.dart';
import 'package:pixmania/user%20model/usermodel.dart';
import 'package:provider/provider.dart';

class PostCard extends StatelessWidget {
  PostCard({super.key, this.postImage, required this.snap});
  String? postImage;
  bool isLiked = false;
  final snap;
  @override
  Widget build(BuildContext context) {
    // timePosted = DateFormat('yyyy-MM-dd').format(snap['dateTime']);
    UserData user = Provider.of<UserProvider>(context).getUser;
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 26,
                backgroundColor: Colors.black87,
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(snap['profileImage']),
                ),
              ),
            ),
            Text(
              snap['userName'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
        GestureDetector(
          onDoubleTap: () {
            FireStore().likePost(snap['postId'], user.uid!, snap['likes']);
          },
          child: Container(
            child: Image(image: NetworkImage(snap['postUrl'])),
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  FireStore()
                      .likePost(snap['postId'], user.uid!, snap['likes']);
                },
                icon: snap['likes'].contains(user.uid)
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      )
                    : const Icon(Icons.favorite_border_outlined)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CommentScreen(),
                  ));
                },
                icon: const Icon(Icons.chat)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 5,
            ),
            Text('${snap['likes'].length} Likes'),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            width: 10,
          ),
          Text(snap['userName'],
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(
            width: 5,
          ),
          Text(snap['description'],
              style: const TextStyle(color: Colors.black87))
        ]),
        kbox10,
        const SizedBox(
          child: Text(
            'View all 20 comments',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        Text(DateFormat.yMMMd().format(snap['dateTime'].toDate())),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}
