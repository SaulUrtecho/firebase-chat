import 'package:flutter/material.dart';

enum SnackbarType {
  error,
  success,
  info;

  Color get color {
    switch (this) {
      case error:
        return Colors.red;
      case success:
        return Colors.green;
      case info:
        return Colors.lightBlue;
    }
  }
}
