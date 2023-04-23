import 'package:either_dart/either.dart';
import 'package:todo_firestore/data/firebase/firestore/firebase_firestore_repository.dart';
import 'package:todo_firestore/data/firebase/models/message_model.dart';
import 'package:todo_firestore/presentation/architecture/failures.dart';
import 'package:todo_firestore/presentation/architecture/use_cases.dart';

class UpdateMessageUseCase implements InputUseCase<void, MessageModel> {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;

  UpdateMessageUseCase(this._firebaseFirestoreRepository);

  @override
  Future<Either<Failure, void>> run(MessageModel input) async {
    return _firebaseFirestoreRepository.updateMessage(input);
  }
}
