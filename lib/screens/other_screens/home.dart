import 'package:flutter/material.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/widgets/homescreen_widgets/post_card_widget.dart';
import 'package:pixmania/widgets/login_widgets/name_logo.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final List<String> images = [
    'assets/posts/275933.jpg',
    'assets/posts/sd.jpg',
    'assets/posts/thumbbig-147879.webp'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Container(color: Colors.white, child: const NamePixmania()),
          Expanded(
              child: Container(
            decoration: kboxDecoration,
            child: CustomScrollView(
              slivers: <Widget>[
                //2
                const SliverAppBar(
                    backgroundColor: Colors.white38,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: NamePixmania(),
                    )),
                //3
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, int index) {
                      return PostCard(
                        postImage: images[index],
                      );

                      // ListTile(
                      //   leading: Container(
                      //       padding: const EdgeInsets.all(8),
                      //       width: 100,
                      //       child: const Placeholder()),
                      //   title: Text('Place ${index + 1}', textScaleFactor: 2),
                      // );
                    },
                    childCount: 3,
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
