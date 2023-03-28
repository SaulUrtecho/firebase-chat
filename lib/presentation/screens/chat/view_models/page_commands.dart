import 'package:todo_firestore/presentation/architecture/page_command.dart';

class UpdateTextController extends PageCommand {
  final String text;

  UpdateTextController(this.text);
}

class UserLogOut extends PageCommand {}
