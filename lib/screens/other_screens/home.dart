import 'package:flutter/cupertino.dart';
import 'package:pixmania/basic_widgets/name_logo.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [NamePixmania()],
      ),
    );
  }
}
