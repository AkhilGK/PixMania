import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pixmania/constants/constants.dart';
import 'package:pixmania/screens/other_screens/settings_screen.dart';
import 'package:pixmania/services/firestore.dart';
import 'package:pixmania/user%20model/usermodel.dart';

// class ProfileCard extends StatelessWidget {
//   ProfileCard({
//     super.key,
//     required this.name,
//   });
//   String name;

//   @override
//   Widget build(BuildContext context) {
//     UserData? user = Provider.of<UserProvider>(context).getUser;
//     String imagePath = user?.profileImage == null
//         ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZSk4gp49octHXf0Tug_Fdbd0eamGYhLd1Lcoy8j1l18_Tyt0OzkqaZ8r8TDmveiInAxo&usqp=CAU"
//         : user!.profileImage!;
//     String followers =
//         user?.followers == null ? "0" : user!.followers!.length.toString();
//     String following =
//         user?.followers == null ? "0" : user!.following!.length.toString();
//     String userName = user?.userName == null ? "PixManiaUser" : user!.userName!;

//     return Card(
//       margin: const EdgeInsets.all(0),
//       color: Colors.white70,
//       // elevation: 0,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CircleAvatar(
//                           backgroundImage: NetworkImage(imagePath),
//                           radius: 35,
//                           child: const Padding(
//                             padding: EdgeInsets.all(5.0),
//                           ),
//                         ))),
//                 Expanded(
//                   child: Text(
//                     userName,
//                     style: const TextStyle(fontSize: 24),
//                   ),
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => SettingScreen(),
//                       ));
//                     },
//                     child: const Icon(Icons.edit)),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Column(
//                 children: [Text(followers), const Text('Followers')],
//               ),
//               Column(
//                 children: [Text(following), const Text('Following')],
//               )
//             ],
//           ),
//           kbox20,
//         ],
//       ),
//     );
//   }
// }
class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: Colors.white70,
      child: StreamBuilder<DocumentSnapshot>(
        stream: FireStore().userCollectionReference.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = UserData.fromSnap(snapshot.data!);
            String imagePath = userData.profileImage ??
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZSk4gp49octHXf0Tug_Fdbd0eamGYhLd1Lcoy8j1l18_Tyt0OzkqaZ8r8TDmveiInAxo&usqp=CAU";
            String followers = userData.followers?.length.toString() ?? "0";
            String following = userData.following?.length.toString() ?? "0";
            String userName = userData.userName ?? "PixManiaUser";

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 37,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(imagePath),
                            radius: 35,
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          userName,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SettingScreen(),
                            ),
                          );
                        },
                        child: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(followers),
                          const Text('Followers'),
                        ],
                      ),
                      const VerticalDivider(
                        thickness: 2,
                        color: Colors.grey,
                        width: 2,
                      ),
                      Column(
                        children: [
                          Text(following),
                          const Text('Following'),
                        ],
                      ),
                    ],
                  ),
                ),
                kbox20,
              ],
            );
          } else if (snapshot.hasError) {
            return const Text('Error retrieving user data');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
