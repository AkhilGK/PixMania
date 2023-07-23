import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  String chatId;
  String message;
  Timestamp time;
  String receiver;
  Chat(
      {required this.chatId,
      required this.message,
      required this.time,
      required this.receiver});

  Map<String, dynamic> toJson() {
    return {
      'chatid': chatId,
      'message': message,
      'time': time,
      'receiver': receiver
    };
  }

  Chat fromJson(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Chat(
        chatId: snapshot['chatId'],
        message: snapshot['message'],
        time: snapshot['time'],
        receiver: snapshot['receiver']);
  }
}
