import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:pixmania/services/storage_methods.dart';
import 'package:pixmania/user%20model/usermodel.dart';

class FireStore {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final DocumentReference userCollectionReference = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid);

//get data from firebase
  Future<UserData> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _fireStore.collection('users').doc(currentUser.uid).get();
    return UserData.fromSnap(snap);
  }

//stream to get user data
  // Stream<QueryDocumentSnapshot> get users {
  //   return userCollectionReference.snapshots();
  // }

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
    UserData userData = UserData(
        uid: _auth.currentUser!.uid,
        userName:
            _auth.currentUser!.email!.split('@')[0], //to remove the domain part
        bio: 'pixMania User',
        profileImage: imagePath,
        followers: [],
        following: []);

    await _fireStore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .set(userData.toJson());
  }
}
