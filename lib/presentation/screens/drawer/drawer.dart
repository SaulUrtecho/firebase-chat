import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:todo_firestore/presentation/design/profile_avatar.dart';
import 'package:todo_firestore/presentation/screens/chat/view_models/chat_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<AuthenticationBloc>().state.user;
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 25),
            height: 160,
            color: Colors.blue,
            child: ListTile(
              leading: ProfileAvatar(
                radius: 27,
                url: currentUser?.avatar,
              ),
              title: Text(currentUser?.email ?? ''),
              subtitle: Text(currentUser?.name ?? ''),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Edit Profile', style: TextStyle(fontSize: 16.0)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'edit_profile');
                  },
                ),
                const Spacer(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout', style: TextStyle(fontSize: 16.0)),
                  onTap: () => context.read<ChatBloc>().add(const OnSignOut()),
                ),
                const SizedBox(height: 40.0)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
