import 'package:flutter/material.dart';
import 'package:todo_firestore/presentation/design/snackbar/snackbar_types.dart';

class AppSnackbar extends SnackBar {
  final ScaffoldMessengerState _messengerState;

  AppSnackbar(this._messengerState, String title, SnackbarType type, {super.key})
      : super(content: Text(title), backgroundColor: type.color);

  void show() => _messengerState.showSnackBar(this);
}
