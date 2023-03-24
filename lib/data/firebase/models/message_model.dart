import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String message;
  final String sender;
  final Timestamp created;

  MessageModel({required this.id, required this.message, required this.sender, Timestamp? created})
      : created = created ?? Timestamp.now();

  MessageModel.toSend({required this.message, required this.sender})
      : id = '',
        created = Timestamp.now();

  factory MessageModel.fromQueryDocument(QueryDocumentSnapshot<Map<String, dynamic>> queryDoc) {
    final data = queryDoc.data();
    return MessageModel(
      id: queryDoc.id,
      message: data['message'],
      sender: data['sender'],
      created: data['created'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['sender'] = sender;
    data['created'] = created;
    return data;
  }
}
