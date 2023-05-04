import 'dart:io';

import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? url;
  final File? file;
  final double radius;

  const ProfileAvatar({super.key, this.url, this.file, this.radius = 28});

  @override
  Widget build(BuildContext context) {
    ImageProvider? background;

    if (url != null) {
      background = url != null ? NetworkImage(url!) : null;
    }
    if (file != null) {
      background = file != null ? FileImage(file!) : null;
    }
    return CircleAvatar(
      backgroundImage: background,
      radius: radius,
      child: background == null ? const Icon(Icons.person) : null,
    );
  }
}
