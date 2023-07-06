import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/screens/other_screens/comment_screen.dart';
import 'package:pixmania/services/firestore.dart';
import 'package:pixmania/user%20model/usermodel.dart';
import 'package:pixmania/utils/utils.dart';
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
                radius: 24,
                backgroundColor: Colors.black87,
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(snap['profileImage']),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  snap['userName'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  DateFormat.yMMMd().format(snap['dateTime'].toDate()),
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
        GestureDetector(
          onDoubleTap: () {
            FireStore().likePost(snap['postId'], user.uid!, snap['likes']);
          },
          child: Container(
            child: InteractiveViewer(
                child: Image(image: NetworkImage(snap['postUrl']))),
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
                    builder: (context) => CommentScreen(
                      snap: snap,
                    ),
                  ));
                },
                icon: const Icon(Icons.chat_outlined)),
            user.uid == snap['uid']
                ? IconButton(
                    onPressed: () async {
                      await FireStore()
                          .deletePost(snap['postId'], snap['postUrl']);
                      showSnackBar(context, 'Post Deleted!');
                    },
                    icon: const Icon(
                      Icons.menu_outlined,
                      size: 26,
                    ))
                : const SizedBox()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 15,
            ),
            Text('${snap['likes'].length} Likes'),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            width: 15,
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
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CommentScreen(
                    snap: snap,
                  ),
                ));
              },
              child: const SizedBox(
                child: Text(
                  'View all comments',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
        kbox10,
        const Divider(
          thickness: 2,
          height: 0,
        )
      ],
    );
  }
}
