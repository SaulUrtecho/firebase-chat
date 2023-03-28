import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/presentation/screens/chat/components/message_bubble.dart';
import 'package:todo_firestore/presentation/screens/chat/view_models/chat_bloc.dart';
import 'package:todo_firestore/presentation/screens/chat/view_models/page_commands.dart';
import 'package:todo_firestore/presentation/themes/constants.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _messageTextController = TextEditingController();

  @override
  void dispose() {
    _messageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatBloc, ChatState>(
      listenWhen: (_, current) => current.pageCommand != null,
      listener: (context, state) {
        final command = state.pageCommand;
        if (command is UserLogOut) {
          Navigator.of(context).pop();
        }
        if (command is UpdateTextController) {
          _messageTextController.text = command.text;
        }
        context.read<ChatBloc>().add(const ClearChatCommand());
      },
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => context.read<ChatBloc>().add(const OnSignOut()),
              ),
            ],
            title: const Text('⚡️Chat'),
            backgroundColor: Colors.lightBlueAccent),
        body: SafeArea(
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              return state.messages.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        Expanded(
                          child: ListView(
                            reverse: true,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            children: state.messages.map((e) => MessageBubble(message: e, isLoggedIn: false)).toList(),
                          ),
                        ),
                        Container(
                          decoration: kMessageContainerDecoration,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _messageTextController,
                                  decoration: kMessageTextFieldDecoration,
                                ),
                              ),
                              BlocBuilder<ChatBloc, ChatState>(
                                buildWhen: (previous, current) => previous.isSending != current.isSending,
                                builder: (context, state) {
                                  return TextButton(
                                    onPressed: state.isSending
                                        ? null
                                        : () async {
                                            context
                                                .read<ChatBloc>()
                                                .add(OnSendMessagePressed(_messageTextController.text));
                                            _messageTextController.clear();
                                          },
                                    child: const Text('Send', style: kSendButtonTextStyle),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
