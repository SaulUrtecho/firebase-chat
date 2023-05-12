import 'package:rxdart/rxdart.dart';
import 'package:todo_firestore/presentation/design/snackbar/snackbar_types.dart';

class MessengerManager {
  // Stream which receive an specific kind of message
  final messages = PublishSubject<AppMessage>();

  void showSnackSuccess(String title) {
    messages.add(AppMessage(title, SnackbarType.success));
  }

  void showSnackError(String title) {
    messages.add(AppMessage(title, SnackbarType.error));
  }

  void showSnackInfo(String title) {
    messages.add(AppMessage(title, SnackbarType.info));
  }
}

// DTO for MessengerManager
class AppMessage {
  final String title;
  final SnackbarType type;
  const AppMessage(this.title, this.type);
}
