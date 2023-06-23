import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:pixmania/services/storage_methods.dart';
import 'package:pixmania/user%20model/usermodel.dart';

class FireStore {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

//get data from firebase
  Future<UserData> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _fireStore.collection('users').doc(currentUser.uid).get();
    return UserData.fromSnap(snap);
  }

//update the profile picture
  Future<void> uploadProfile(
    // String? email,
    String userName,
    String bio,
    Uint8List profileImage,
    // String uid,
  ) async {
    String imagePath = await StorageMethods()
        .uploadImageToStorage('profilePics', profileImage, false);

    await _fireStore.collection('users').doc(_auth.currentUser!.uid).set({
      'userName': userName,
      'uid': _auth.currentUser!.uid,
      'email': _auth.currentUser!.email,
      'bio': bio,
      'profileImage': imagePath,
    });
  }
}
