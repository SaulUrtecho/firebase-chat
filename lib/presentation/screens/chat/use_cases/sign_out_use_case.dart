import 'package:either_dart/either.dart';
import 'package:todo_firestore/data/firebase/auth/firebase_auth_repository.dart';
import 'package:todo_firestore/presentation/architecture/failures.dart';
import 'package:todo_firestore/presentation/architecture/use_cases.dart';

class SignOutUseCase implements NoInputUseCase<void> {
  final FirebaseAuthRepository _firebaseAuthRepository;

  SignOutUseCase(this._firebaseAuthRepository);

  @override
  Future<Either<Failure, void>> run() async {
    return _firebaseAuthRepository.signOut();
  }
}
