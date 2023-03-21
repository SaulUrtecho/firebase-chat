import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_firestore/firebase/firebase_auth_repository.dart';
import 'package:todo_firestore/presentation/architecture/failures.dart';
import 'package:todo_firestore/presentation/architecture/use_cases.dart';

class SignInUseCase implements InputUseCase<UserCredential, SignInInput> {
  final FirebaseAuthRepository _firebaseAuthRepository;

  SignInUseCase(this._firebaseAuthRepository);

  @override
  Future<Either<Failure, UserCredential>> run(SignInInput input) async {
    return _firebaseAuthRepository.signInWithEmailAndPassword(email: input.email, password: input.password);
  }
}

/// we create a object because we need to use an email and a password
/// this object will be passed like parameter in the above function
class SignInInput {
  final String email;
  final String password;
  const SignInInput(this.email, this.password);
}
