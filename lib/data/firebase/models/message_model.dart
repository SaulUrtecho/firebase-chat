class MessageModel {
  final String message;
  final String sender;
  final String created;

  const MessageModel({required this.message, required this.sender, required this.created});

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
