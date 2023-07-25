// import 'dart:typed_data';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:pixmania/providers/userprovider.dart';
// import 'package:pixmania/services/firestore.dart';
// import 'package:pixmania/utils/utils.dart';
// import 'package:pixmania/widgets/login_widgets/button.dart';
// import 'package:pixmania/widgets/login_widgets/colors.dart';
// import 'package:pixmania/widgets/login_widgets/formfield.dart';
// import 'package:pixmania/services/auth.dart';
// import 'package:provider/provider.dart';

// import '../../user model/usermodel.dart';

// class SettingScreen extends StatefulWidget {
//   const SettingScreen({super.key});

//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

// class _SettingScreenState extends State<SettingScreen> {
//   AuthServices auth = AuthServices();

//   FirebaseAuth user = FirebaseAuth.instance;

//   TextEditingController nameController = TextEditingController();

//   TextEditingController bioController = TextEditingController();

//   Uint8List? selectedImage;

//   @override
//   Widget build(BuildContext context) {
//     UserData? userdata = Provider.of<UserProvider>(context).getUser;
//     String imagePath = userdata.profileImage == null
//         ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZSk4gp49octHXf0Tug_Fdbd0eamGYhLd1Lcoy8j1l18_Tyt0OzkqaZ8r8TDmveiInAxo&usqp=CAU"
//         : userdata.profileImage!;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: SafeArea(
//           child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextButton.icon(
//               label: const Text('Edit Profile'),
//               onPressed: () {
//                 _showAlertDialog(context, imagePath);
//               },
//               icon: const Icon(Icons.person)),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30),
//             child: SubmitButton(title: 'Log out', onpressfun: logOut),
//           )
//         ],
//       )),
//     );
//   }

//   void logOut() async {
//     await auth.signout();
//     Navigator.of(context).pop();
//   }

//   void _showAlertDialog(BuildContext context, String imagepath) {
//     void imagepick() async {
//       Uint8List image = await pickImage(ImageSource.gallery);

//       setState(() {
//         selectedImage = image;
//       });
//     }

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: scafoldBg,
//           // title: const Text('Profile'),
//           // content: const Text('dfsaf.'),
//           actions: <Widget>[
//             Column(
//               children: [
//                 Stack(
//                   children: [
//                     selectedImage != null
//                         ? CircleAvatar(
//                             radius: 65,
//                             backgroundImage: MemoryImage(selectedImage!),
//                             child: const Padding(
//                               padding: EdgeInsets.all(10.0),
//                             ),
//                           )
//                         : CircleAvatar(
//                             radius: 65,
//                             backgroundImage: NetworkImage(imagepath),
//                             child: const Padding(
//                               padding: EdgeInsets.all(10.0),
//                               // child: Image.network(
//                               //   image,
//                               //   fit: BoxFit.fill,
//                               // ),
//                             ),
//                           ),
//                     Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: IconButton(
//                             onPressed: () {
//                               imagepick();
//                             },
//                             icon: const Icon(Icons.add_a_photo)))
//                   ],
//                 ),
//                 CustomFormfield(
//                     controller: nameController,
//                     hintText: 'Enter Username',
//                     label: 'Username'),
//                 CustomFormfield(
//                     controller: bioController,
//                     hintText: 'Tell about your self',
//                     label: 'Bio'),
//                 SubmitButton(
//                   title: 'Save Changes',
//                   onpressfun: () {
//                     saveProfile(nameController.text, bioController.text,
//                         selectedImage!, context);
//                     Navigator.pop(context);
//                   },
//                 )
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   //save or edit profile
//   saveProfile(
//       String userName, String bio, Uint8List image, BuildContext context) {
//     FireStore().uploadProfile(userName, bio, image, context);
//   }
// }

import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/screens/other_screens/edit_profile.dart';
import 'package:pixmania/services/firestore.dart';
import 'package:pixmania/widgets/login_widgets/button.dart';
import 'package:pixmania/services/auth.dart';
import 'package:provider/provider.dart';
import '../../models/usermodel.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  AuthServices auth = AuthServices();

  FirebaseAuth user = FirebaseAuth.instance;

  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  Uint8List? selectedImage;

  @override
  Widget build(BuildContext context) {
    UserData? userdata = Provider.of<UserProvider>(context).getUser;
    String imagePath = userdata.profileImage == null
        ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZSk4gp49octHXf0Tug_Fdbd0eamGYhLd1Lcoy8j1l18_Tyt0OzkqaZ8r8TDmveiInAxo&usqp=CAU"
        : userdata.profileImage!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              label: const Text('Edit Profile'),
              onPressed: () {
                // _showAlertDialog(context, imagePath);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EditProfile(),
                ));
              },
              icon: const Icon(Icons.person),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SubmitButton(title: 'Log out', onpressfun: logOut),
            ),
          ],
        ),
      ),
    );
  }

  void logOut() async {
    await auth.signout();
    Navigator.of(context).pop();
  }

  void _showAlertDialog(BuildContext context, String imagepath) {
    void imagepick() async {
      Uint8List? image = await pickImage(ImageSource.gallery);

      if (image != null) {
        setState(() {
          selectedImage = image;
        });
      }
    }

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return StatefulBuilder(
    //       builder: (BuildContext context, StateSetter setState) {
    //         return AlertDialog(
    //           backgroundColor: scafoldBg,
    //           actions: <Widget>[
    //             Column(
    //               children: [
    //                 Stack(
    //                   children: [
    //                     selectedImage != null
    //                         ? CircleAvatar(
    //                             radius: 65,
    //                             backgroundImage: MemoryImage(selectedImage!),
    //                             child: const Padding(
    //                               padding: EdgeInsets.all(10.0),
    //                             ),
    //                           )
    //                         : CircleAvatar(
    //                             radius: 65,
    //                             backgroundImage: NetworkImage(imagepath),
    //                             child: const Padding(
    //                               padding: EdgeInsets.all(10.0),
    //                             ),
    //                           ),
    //                     Positioned(
    //                       bottom: 0,
    //                       right: 0,
    //                       child: IconButton(
    //                         onPressed: () {
    //                           imagepick();
    //                         },
    //                         icon: const Icon(Icons.add_a_photo),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 CustomFormfield(
    //                   controller: nameController,
    //                   hintText: 'Enter Username',
    //                   label: 'Username',
    //                 ),
    //                 CustomFormfield(
    //                   controller: bioController,
    //                   hintText: 'Tell about yourself',
    //                   label: 'Bio',
    //                 ),
    //                 SubmitButton(
    //                   title: 'Save Changes',
    //                   onpressfun: () {
    //                     saveProfile(
    //                       nameController.text,
    //                       bioController.text,
    //                       selectedImage,
    //                       context,
    //                     );
    //                     Navigator.pop(context);
    //                   },
    //                 ),
    //               ],
    //             ),
    //           ],
    //         );
    //       },
    //     );
    //   },
    // );
  }

  // Future<String> saveProfile(
  //   String userName,
  //   String bio,
  //   Uint8List? image,
  //   BuildContext context,
  // ) {
  //   Future<String> res;
  //   if (image != null) {
  //     res = FireStore().uploadProfile(userName, bio, image, context);
  //   } else {
  //     res = 'error' as Future<String>;
  //     // Handle the case when no image is selected
  //   }
  //   return res;
  // }
}

Future<Uint8List?> pickImage(ImageSource imageSource) async {
  ImagePicker imagePicker = ImagePicker();

  XFile? file = await imagePicker.pickImage(source: imageSource);
  if (file != null) {
    return file.readAsBytes();
  }
  print('image not picked');
  return null;
}
