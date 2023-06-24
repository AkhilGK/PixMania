import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  PostCard({super.key, this.postImage});
  String? postImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(),
            ),
            Text('Name')
          ],
        ),
        Container(
          child: Image(image: AssetImage(postImage!)),
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.chat)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
          ],
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}
