part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class OnMessagesUpdated extends ChatEvent {
  final List<MessageModel> messages;

  const OnMessagesUpdated(this.messages);

  @override
  String toString() => 'OnMessagesUpdated';
}

class OnSendMessagePressed extends ChatEvent {
  final String text;

  const OnSendMessagePressed(this.text);

  @override
  String toString() => 'OnSendMessagePressed';
}

class OnSignOut extends ChatEvent {
  const OnSignOut();

  @override
  String toString() => 'OnSignOut';
}
