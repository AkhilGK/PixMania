//@@@@@@//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pixmania/widgets/homescreen_widgets/post_card_widget.dart';

import '../../widgets/login_widgets/name_logo.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  // final List<String> images = [
  //   'assets/posts/275933.jpg',
  //   'assets/posts/sd.jpg',
  //   'assets/posts/thumbbig-147879.webp'
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            floating: true,
            pinned: false,
            snap: false,
            backgroundColor: Colors.white,
            flexibleSpace: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: NamePixmania(),
            ),
          ),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text('Error: ${snapshot.error}'),
                  ),
                );
              } else {
                final documents = snapshot.data!.docs;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => PostCard(snap: documents[index].data()),
                    childCount: documents.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
