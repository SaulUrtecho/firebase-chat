import 'package:either_dart/either.dart';
import 'package:todo_firestore/data/firebase/firestore/firebase_firestore_repository.dart';
import 'package:todo_firestore/presentation/architecture/failures.dart';
import 'package:todo_firestore/presentation/architecture/use_cases.dart';

class DeleteMessageUseCase implements InputUseCase<void, String> {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;

  DeleteMessageUseCase(this._firebaseFirestoreRepository);

  @override
  Future<Either<Failure, void>> run(String input) async {
    return _firebaseFirestoreRepository.deleteMessage(input);
  }
}
