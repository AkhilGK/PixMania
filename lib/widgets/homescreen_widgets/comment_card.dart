import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListTile(
          leading: CircleAvatar(
            radius: 22,
          ),
          trailing: Text('22-2-2023'),
          title: Text(
            'UserName',
            style: TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            'Some Comments',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Divider(
          height: 1,
        ),
      ],
    );
  }
}
