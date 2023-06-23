import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pixmania/services/firestore.dart';
import 'package:pixmania/widgets/login_widgets/button.dart';
import 'package:pixmania/widgets/login_widgets/colors.dart';
import 'package:pixmania/widgets/login_widgets/formfield.dart';
import 'package:pixmania/services/auth.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  AuthServices auth = AuthServices();
  FirebaseAuth user = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  Uint8List? selectedImage;
  void imagepick() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    selectedImage = image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton.icon(
              label: const Text('Profile'),
              onPressed: () {
                _showAlertDialog(context);
              },
              icon: const Icon(Icons.person)),
          SubmitButton(title: 'Log out', onpressfun: logOut)
        ],
      )),
    );
  }

  void logOut() async {
    await auth.signout();
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: scafoldBg,
          // title: const Text('Profile'),
          // content: const Text('dfsaf.'),
          actions: <Widget>[
            Column(
              children: [
                Stack(
                  children: [
                    selectedImage != null
                        ? CircleAvatar(
                            radius: 65,
                            backgroundImage: MemoryImage(selectedImage!),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),

                              //child:
                              //  Image.asset(
                              //   "assets/logo/camLogo.png",
                              //   fit: BoxFit.fill,
                              // ),
                            ),
                          )
                        : CircleAvatar(
                            radius: 65,
                            // backgroundImage: MemoryImage(selectedImage),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                "assets/logo/camLogo.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                            onPressed: () {
                              imagepick();
                            },
                            icon: const Icon(Icons.add_a_photo)))
                  ],
                ),
                CustomFormfield(
                    controller: nameController,
                    hintText: 'Enter Username',
                    label: 'Username'),
                CustomFormfield(
                    controller: bioController,
                    hintText: 'Tell about your self',
                    label: 'Bio'),
                SubmitButton(
                  title: 'Save Changes',
                  onpressfun: () {
                    saveProfile(nameController.text, bioController.text,
                        selectedImage!);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        );
      },
    );
  }

//pic an image from gallery
  pickImage(ImageSource imageSource) async {
    ImagePicker imagePicker = ImagePicker();

    XFile? file = await imagePicker.pickImage(source: imageSource);
    if (file != null) {
      return file.readAsBytes();
    }
    print('image not picked');
  }

  //save or edit profile
  saveProfile(String userName, String bio, Uint8List image) {
    FireStore().uploadProfile(
      userName,
      bio,
      image,
    );
  }
}
