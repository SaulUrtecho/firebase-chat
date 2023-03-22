import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_firestore/presentation/screens/sign_in/components/sign_in_view.dart';
import 'package:todo_firestore/presentation/screens/sign_in/view_models/sign_in_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<SignInBloc>(),
      child: BlocListener<SignInBloc, SignInState>(
        listenWhen: (previous, current) => previous.isUserCreated != current.isUserCreated,
        listener: (context, _) => Navigator.pushReplacementNamed(context, 'chat'),
        child: const SignInView(),
      ),
    );
  }
}
