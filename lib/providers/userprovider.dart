import 'package:flutter/cupertino.dart';
import 'package:pixmania/services/firestore.dart';
import 'package:pixmania/models/usermodel.dart';

class UserProvider with ChangeNotifier {
  UserData _user = UserData(
      uid: 'pix',
      userName: 'pix',
      bio: 'pix',
      profileImage: 'pix',
      followers: [],
      following: [],
      chats: []);
  //This initialization is unnessossory there is late intialization error
  UserData get getUser => _user;
  final FireStore _storeMethods = FireStore();
  Future<void> refreshUser() async {
    UserData user = await _storeMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
