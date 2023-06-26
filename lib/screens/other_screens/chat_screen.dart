import 'package:flutter/cupertino.dart';
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
        SubmitButton(title: 'Log out', onpressfun: logOut)
      ],
    );
  }

  void logOut() async {
    await auth.signout();
  }
}
