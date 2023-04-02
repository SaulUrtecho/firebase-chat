import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_firestore/presentation/screens/sign_up/components/sign_up_view.dart';
import 'package:todo_firestore/presentation/screens/sign_up/view_models/sign_up_bloc.dart';
import 'package:todo_firestore/presentation/blocs/authentication/authentication_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<SignUpBloc>(),
      child: BlocListener<SignUpBloc, SignUpState>(
        listenWhen: (previous, current) => previous.isUserCreated != current.isUserCreated,
        listener: (context, _) => context.read<AuthenticationBloc>().add(const OnLogin()),
        child: const SignUpView(),
      ),
    );
  }
}
