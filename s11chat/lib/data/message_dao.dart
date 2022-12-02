import 'package:firebase_database/firebase_database.dart';
import '../data/message.dart';

class MessageDAO {
  final DatabaseReference _firebaseDatabase =
      FirebaseDatabase.instance.ref().child('chat');

  void saveMessage(Message message) {
    _firebaseDatabase.push().set(message.toJson());
  }

  Query getMessages() {
    return _firebaseDatabase;
  }
}
