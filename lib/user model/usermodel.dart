import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  String userId;
  String userName;
  String about;
  String profileImage;

  Usermodel(
      {required this.userId,
      required this.userName,
      required this.about,
      required this.profileImage});

  factory Usermodel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return Usermodel(
      userId: snapshot.id,
      userName: data?['userName'] ?? '',
      about: data?['about'] ?? '',
      profileImage: data?['profileImage'] ?? '',
    );
  }
}
