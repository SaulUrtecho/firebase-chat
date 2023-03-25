import 'package:flutter/material.dart';

class MessageOptions extends StatelessWidget {
  final VoidCallback onDeletePressed;
  final VoidCallback onEditPressed;

  const MessageOptions({super.key, required this.onDeletePressed, required this.onEditPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit'),
            onTap: () {
              onEditPressed();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete'),
            onTap: () {
              onDeletePressed();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
