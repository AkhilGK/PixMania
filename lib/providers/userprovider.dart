import 'package:flutter/cupertino.dart';
import 'package:pixmania/services/firestore.dart';
import 'package:pixmania/user%20model/usermodel.dart';

class UserProvider with ChangeNotifier {
  UserData? _user;
  UserData get getUser => _user!;
  final FireStore _storeMethods = FireStore();
  Future<void> refreshUser() async {
    UserData user = await _storeMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
