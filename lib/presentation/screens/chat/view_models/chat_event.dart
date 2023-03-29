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

  const OnSendMessagePressed({required this.text});

  @override
  String toString() => 'OnSendMessagePressed';
}

class OnUpdateMessagePressed extends ChatEvent {
  final String text;

  const OnUpdateMessagePressed(this.text);

  @override
  String toString() => 'OnUpdateMessagePressed';
}

class OnDeleteMessagePressed extends ChatEvent {
  final String messageId;

  const OnDeleteMessagePressed(this.messageId);

  @override
  String toString() => 'OnDeleteMessagePressed';
}

class OnEditMessagePressed extends ChatEvent {
  final MessageModel message;

  const OnEditMessagePressed(this.message);

  @override
  String toString() => 'OnEditMessagePressed';
}

class ClearChatCommand extends ChatEvent {
  const ClearChatCommand();
  @override
  String toString() => 'ClearChatCommand';
}

class OnSignOut extends ChatEvent {
  const OnSignOut();

  @override
  String toString() => 'OnSignOut';
}
