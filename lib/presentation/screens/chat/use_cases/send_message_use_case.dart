import 'package:either_dart/either.dart';
import 'package:todo_firestore/data/firebase/firestore/firebase_storage_repository.dart';
import 'package:todo_firestore/data/firebase/models/message_model.dart';
import 'package:todo_firestore/presentation/architecture/failures.dart';
import 'package:todo_firestore/presentation/architecture/use_cases.dart';

class SendMessageUseCase implements InputUseCase<void, MessageModel> {
  final FirebaseStorageRepository _firebaseStorageRepository;

  SendMessageUseCase(this._firebaseStorageRepository);

  @override
  Future<Either<Failure, void>> run(MessageModel input) async {
    return _firebaseStorageRepository.saveMessage(input);
  }
}
