import 'package:flutter/material.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/screens/other_screens/chats.dart';
import 'package:pixmania/services/auth.dart';
import 'package:pixmania/user%20model/usermodel.dart';
import 'package:pixmania/widgets/common_widgets/back_button.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    UserData user = Provider.of<UserProvider>(context).getUser;
    return Container(
      decoration: kboxDecoration,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const CustomBackButton(),
                Expanded(
                  child: Text(
                    user.userName!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(user.profileImage!),
                  ),
                )
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  // UserData user = UserData.fromSnap(documents[index]);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: InkWell(
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 15, right: 15),
                        // visualDensity: const VisualDensity(vertical: -4),
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(user.profileImage!),
                            // AssetImage('assets/logo/camLogo.png'),
                            radius: 26,
                          ),
                        ),
                        title: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Chats(),
                              ));
                            },
                            child: Text(user.userName!)),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text('last chat'), Text('time')],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
