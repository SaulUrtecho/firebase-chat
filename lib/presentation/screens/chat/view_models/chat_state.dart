part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final List<MessageModel> messages;
  final PageCommand? pageCommand;
  final PageState pageState;
  final bool isSending;
  final bool isEditing;

  const ChatState({
    required this.messages,
    this.pageCommand,
    required this.pageState,
    required this.isSending,
    required this.isEditing,
  });

  @override
  List<Object?> get props => [messages, pageCommand, pageState, isSending, isEditing];

  ChatState copyWith({
    List<MessageModel>? messages,
    PageCommand? pageCommand,
    PageState? pageState,
    bool? isSending,
    bool? isEditing,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      pageCommand: pageCommand,
      pageState: pageState ?? this.pageState,
      isSending: isSending ?? this.isSending,
      isEditing: isEditing ?? this.isEditing,
    );
  }

  factory ChatState.initial() {
    return const ChatState(
      messages: [],
      pageState: PageState.initial,
      isSending: false,
      isEditing: false,
    );
  }
}
