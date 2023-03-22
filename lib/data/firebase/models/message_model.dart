import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String sender;
  final Timestamp created;

  MessageModel({required this.message, required this.sender, Timestamp? created})
      : created = created ?? Timestamp.now();

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
      sender: json['sender'],
      created: json['created'],
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
