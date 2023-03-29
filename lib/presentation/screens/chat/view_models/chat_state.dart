part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final List<MessageModel> messages;
  final PageCommand? pageCommand;
  final PageState pageState;
  final bool isSending;
  final String editMessageId;

  const ChatState({
    required this.messages,
    this.pageCommand,
    required this.pageState,
    required this.isSending,
    required this.editMessageId,
  });

  @override
  List<Object?> get props => [messages, pageCommand, pageState, isSending, editMessageId];

  ChatState copyWith({
    List<MessageModel>? messages,
    PageCommand? pageCommand,
    PageState? pageState,
    bool? isSending,
    String? editMessageId,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      pageCommand: pageCommand,
      pageState: pageState ?? this.pageState,
      isSending: isSending ?? this.isSending,
      editMessageId: editMessageId ?? this.editMessageId,
    );
  }

  factory ChatState.initial() {
    return const ChatState(
      messages: [],
      pageState: PageState.initial,
      isSending: false,
      editMessageId: '',
    );
  }
}
