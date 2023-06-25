import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:pixmania/services/storage_methods.dart';
import 'package:pixmania/user%20model/post.dart';
import 'package:pixmania/user%20model/usermodel.dart';
import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

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

//update the profile picture only using update method
  Future<void> uploadProfile(
    String userName,
    String bio,
    Uint8List profileImage,
  ) async {
    String imagePath = await StorageMethods()
        .uploadImageToStorage('profilePics', profileImage, false);

    await _fireStore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .update({'userName': userName, 'bio': bio, 'profileImage': imagePath});
  }

  //method to add a post
  Future<String> uploadPost(String description, Uint8List postFile, String uid,
      String userName, String profileImage) async {
    String res = "Some errror occured";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', postFile, true);
      String postId = const Uuid().v1();

      Post post = Post(
          uid: uid,
          userName: userName,
          description: description,
          profileImage: profileImage,
          postId: postId,
          dateTime: DateTime.now(),
          postUrl: photoUrl,
          likes: []);

      _fireStore.collection('posts').doc(postId).set(post.toJson());
    } catch (err) {}
  }
}
