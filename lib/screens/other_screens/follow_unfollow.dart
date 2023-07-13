import 'package:flutter/material.dart';

class FollowScreen extends StatelessWidget {
  FollowScreen({super.key, required this.isFollowers});
  bool isFollowers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Name',
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
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
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 15),
                  // visualDensity: const VisualDensity(vertical: -4),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/logo/camLogo.png'),
                    radius: 35,
                  ),
                  title: Text(
                    'name$index',
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
