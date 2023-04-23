import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_firestore/presentation/screens/edit_profile/components/edit_profile_view.dart';
import 'package:todo_firestore/presentation/screens/edit_profile/view_models/bloc/edit_profile_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<EditProfileBloc>(),
      child: const EditProfileView(),
    );
  }
}
