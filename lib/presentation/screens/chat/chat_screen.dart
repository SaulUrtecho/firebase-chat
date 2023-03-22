import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_firestore/presentation/screens/chat/components/chat_view.dart';
import 'package:todo_firestore/presentation/screens/chat/view_models/chat_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<ChatBloc>(),
      child: BlocListener<ChatBloc, ChatState>(
        listenWhen: (previous, current) => previous.isLogedOut != current.isLogedOut,
        listener: (context, _) => Navigator.of(context).pop(),
        child: const ChatView(),
      ),
    );
  }
}
