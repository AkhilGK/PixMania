import 'package:flutter/material.dart';
import 'package:pixmania/screens/home_screen/home_screen.dart';
import 'package:pixmania/services/auth.dart';
import 'package:pixmania/widgets/login_widgets/button.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: const Center(
            child: Text('ChatScreen'),
          ),
        ),
        SubmitButton(title: 'Log out', onpressfun: logOut),
        ElevatedButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => VisitProfile(isfollowing: true),
              // ));
            },
            child: const Text('Profilevisit'))
      ],
    );
  }

  void logOut() async {
    HomeScreen.selectedBottomNotifier.value = 0;
    await auth.signout();
  }
}
