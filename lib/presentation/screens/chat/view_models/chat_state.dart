part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final List<MessageModel> messages;
  final PageState pageState;
  final bool isSending;
  final bool isLogedOut;

  const ChatState({required this.messages, required this.pageState, required this.isSending, required this.isLogedOut});

  @override
  List<Object> get props => [messages, pageState, isSending, isLogedOut];

  ChatState copyWith({List<MessageModel>? messages, PageState? pageState, bool? isSending, bool? isLogedOut}) {
    return ChatState(
      messages: messages ?? this.messages,
      pageState: pageState ?? this.pageState,
      isSending: isSending ?? this.isSending,
      isLogedOut: isLogedOut ?? this.isLogedOut,
    );
  }

  factory ChatState.initial() {
    return const ChatState(
      messages: [],
      pageState: PageState.initial,
      isSending: false,
      isLogedOut: false,
    );
  }
}
