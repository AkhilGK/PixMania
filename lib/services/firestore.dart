import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pixmania/providers/userprovider.dart';
import 'package:pixmania/services/storage_methods.dart';
import 'package:pixmania/user%20model/post.dart';
import 'package:pixmania/user%20model/usermodel.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class FireStore {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

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
  Future<void> uploadProfile(String userName, String bio,
      Uint8List profileImage, BuildContext context) async {
    String imagePath = await StorageMethods()
        .uploadImageToStorage('profilePics', profileImage, false);

    await _fireStore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .update({'userName': userName, 'bio': bio, 'profileImage': imagePath});

    Provider.of<UserProvider>(context).refreshUser();
  }

  //method to add a post
  Future<String> uploadPost(String description, Uint8List postFile, String uid,
      String userName, String profileImage) async {
    String res = "Some errror occured";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', postFile, true);
      //created a uniqe id for each post
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

      await _fireStore.collection('posts').doc(postId).set(post.toJson());
      res = 'Success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //like a post
  Future<void> likePost(
    String postId,
    String uid,
    List likes,
  ) async {
    try {
      if (likes.contains(uid)) {
        await _fireStore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        await _fireStore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //comment a post
  Future<void> commentPost(String userName, String comment, String uid,
      String profileImage, String postId) async {
    try {
      if (comment.isNotEmpty) {
        String commentId = const Uuid().v4();
        await _fireStore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profileImage,
          'name': userName,
          'comment': comment,
          'uid': uid,
          'postId': postId,
          'commentId': commentId,
          'timeofComment': DateTime.now()
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //delete a comment
  Future<void> deleteComment(String postId, String commentId) async {
    try {
      await _fireStore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deletePost(String postId, String imageUrl) async {
    try {
      await _fireStore.collection('posts').doc(postId).delete();
      await _firebaseStorage.refFromURL(imageUrl).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
