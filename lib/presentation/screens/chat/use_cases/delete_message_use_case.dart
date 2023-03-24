import 'package:either_dart/either.dart';
import 'package:todo_firestore/data/firebase/firestore/firebase_storage_repository.dart';
import 'package:todo_firestore/presentation/architecture/failures.dart';
import 'package:todo_firestore/presentation/architecture/use_cases.dart';

class DeleteMessageUseCase implements InputUseCase<void, String> {
  final FirebaseStorageRepository _firebaseStorageRepository;

  DeleteMessageUseCase(this._firebaseStorageRepository);

  @override
  Future<Either<Failure, void>> run(String input) async {
    return _firebaseStorageRepository.deleteMessage(input);
  }
}
