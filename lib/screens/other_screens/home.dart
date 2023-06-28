import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pixmania/widgets/homescreen_widgets/post_card_widget.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final List<String> images = [
    'assets/posts/275933.jpg',
    'assets/posts/sd.jpg',
    'assets/posts/thumbbig-147879.webp'
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return ListView.builder(
          itemBuilder: (context, index) =>
              PostCard(snap: snapshot.data!.docs[index].data()),
          itemCount: snapshot.data!.docs.length,
        );
      },
    );
    // return Center(
    //   child: Column(
    //     children: [
    //       // Container(color: Colors.white, child: const NamePixmania()),
    //       Expanded(
    //           child: Container(
    //         decoration: kboxDecoration,
    //         child: CustomScrollView(
    //           slivers: <Widget>[
    //             //2
    //             const SliverAppBar(
    //                 floating: true,
    //                 pinned: false,
    //                 snap: false,
    //                 backgroundColor: Colors.white38,
    //                 flexibleSpace: Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 8),
    //                   child: NamePixmania(),
    //                 )),
    //             //3
    //             SliverList(
    //                 delegate: SliverChildBuilderDelegate(
    //               (context, index) =>
    //             )),
    //           ],
    //         ),
    //       ))
    //     ],
    //   ),
    // );
  }
}
