import 'package:flutter/material.dart';
import 'package:pixmania/basic_widgets/name_logo.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Container(color: Colors.white, child: const NamePixmania()),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color.fromARGB(255, 196, 212, 208),
                    Color.fromARGB(255, 134, 233, 187),
                  ]),
            ),
            child: CustomScrollView(
              slivers: <Widget>[
                //2
                const SliverAppBar(
                    backgroundColor: Colors.white38,
                    flexibleSpace: NamePixmania()),
                //3
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, int index) {
                      return ListTile(
                        leading: Container(
                            padding: const EdgeInsets.all(8),
                            width: 100,
                            child: const Placeholder()),
                        title: Text('Place ${index + 1}', textScaleFactor: 2),
                      );
                    },
                    childCount: 20,
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
