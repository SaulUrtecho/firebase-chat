import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/presentation/screens/edit_profile/components/image_options_dialog.dart';
import 'package:todo_firestore/presentation/screens/edit_profile/view_models/bloc/edit_profile_bloc.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Center(
        child: Column(
          children: [
            Container(
              //height: MediaQuery.of(context).size.height * 0.3,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 25),
              height: 160,
              color: Colors.blue,
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    BlocBuilder<EditProfileBloc, EditProfileState>(
                      builder: (context, state) {
                        return CircleAvatar(
                          backgroundImage: state.avatarFile != null ? FileImage(File(state.avatarFile!.path)) : null,
                          radius: 55,
                          backgroundColor: Colors.blueGrey,
                          child: state.avatarFile != null ? null : const Icon(Icons.person, size: 72),
                        );
                      },
                    ),
                    const CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.edit),
                    )
                  ],
                ),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (_) {
                      return const ImageOptionsDialog();
                    },
                  ).then((value) {
                    if (value != null) {
                      // ignore: use_build_context_synchronously
                      context.read<EditProfileBloc>().add(OnImageSourceSelected(value!));
                    }
                  });
                },
              ),
            ),
            const Text('data'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('save picture'),
            )
          ],
        ),
      ),
    );
  }
}
