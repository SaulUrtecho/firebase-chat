import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/data/firebase/models/message_model.dart';
import 'package:todo_firestore/presentation/screens/chat/components/message_options.dart';
import 'package:todo_firestore/presentation/screens/chat/view_models/chat_bloc.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;
  final bool isLoggedIn;

  const MessageBubble({super.key, required this.isLoggedIn, required this.message});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
          context: context,
          builder: (_) {
            return MessageOptions(
              onDeletePressed: () => context.read<ChatBloc>().add(OnDeleteMessagePressed(message.id)),
              onEditPressed: () => context.read<ChatBloc>().add(OnEditMessagePressed(message)),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: isLoggedIn ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(message.sender, style: const TextStyle(fontSize: 15.0, color: Colors.black54)),
            Material(
              elevation: 5.0,
              borderRadius: isLoggedIn
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
              color: isLoggedIn ? Colors.lightBlueAccent : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message.message,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: isLoggedIn ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
