import 'package:either_dart/either.dart';
import 'package:todo_firestore/data/firebase/firestore/firebase_firestore_repository.dart';
import 'package:todo_firestore/data/firebase/models/user_model.dart';
import 'package:todo_firestore/presentation/architecture/failures.dart';
import 'package:todo_firestore/presentation/architecture/use_cases.dart';

class CreateUserUseCase implements InputUseCase<String, UserModel> {
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;

  CreateUserUseCase(this._firebaseFirestoreRepository);

  @override
  Future<Either<Failure, String>> run(UserModel input) async {
    return _firebaseFirestoreRepository.createUser(input);
  }
}
