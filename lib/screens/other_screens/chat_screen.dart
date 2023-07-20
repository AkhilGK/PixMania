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
          child: Center(
            child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/pixmania-182c7.appspot.com/o/profilePics%2FcamLogo.png?alt=media&token=6994a6f8-fc44-4dfa-a328-c964db9a19d8'),
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
