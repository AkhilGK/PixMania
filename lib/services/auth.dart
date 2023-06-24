import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pixmania/user%20model/model.dart';
import 'package:pixmania/user%20model/usermodel.dart';

class AuthServices {
  //created ani nstance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

//creating a userobject from firebase user
  UserModel? getUserFromfirebase(User? user) {
    return user != null ? UserModel(userId: user.uid) : null;
  }

//detection any change in state of firebaseUser
  Stream<UserModel?> get userLog {
    return _auth
        .authStateChanges()
        .map((User? user) => getUserFromfirebase(user));
  }

// register using email and  password
  Future registerWithEmailAndPAssword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      //userModel is added with data
      UserData userData = UserData(
          uid: user!.uid,
          userName: user.email!.split('@')[0], //to remove the domain part
          bio: 'pixMania User',
          profileImage: '',
          followers: [],
          following: []);

      //function to create data base collection
      await _fireStore.collection('users').doc(user.uid).set(userData.toJson());

      return getUserFromfirebase(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          return 'email-already-in-use';
        }
      }
      print(e.toString());
      return null;
    }
  }

  // login using email and  password
  Future logInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return getUserFromfirebase(user!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          return 'user-not-found';
        }
        print(e.toString());
      }

      return null;
    }
  }

  // signing out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in using google account
  signInWithGoogle() async {
    //begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    //userModel is added with data
    UserData userData = UserData(
        uid: _auth.currentUser!.uid,
        userName:
            _auth.currentUser!.email!.split('@')[0], //to remove the domain part
        bio: 'pixMania User',
        profileImage: null,
        followers: [],
        following: []);

    //function to create data base collection
    await _fireStore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .set(userData.toJson());

    //finally, lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
