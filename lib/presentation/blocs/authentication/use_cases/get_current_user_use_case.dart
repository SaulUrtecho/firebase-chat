import 'package:either_dart/either.dart';
import 'package:todo_firestore/data/firebase/firestore/firebase_firestore_repository.dart';
import 'package:todo_firestore/data/firebase/models/user_model.dart';
import 'package:todo_firestore/presentation/architecture/failures.dart';
import 'package:todo_firestore/presentation/architecture/use_cases.dart';

class GetCurrentUserUseCase implements NoInputUseCase<UserModel> {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;

  GetCurrentUserUseCase(this._firebaseFirestoreRepository);

  @override
  Future<Either<Failure, UserModel>> run() async {
    return _firebaseFirestoreRepository.getCurrentUser();
  }
}
