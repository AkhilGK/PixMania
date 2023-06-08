import 'package:firebase_auth/firebase_auth.dart';
import 'package:pixmania/user%20model/model.dart';

class AuthServices {
  //created ani nstance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
}
