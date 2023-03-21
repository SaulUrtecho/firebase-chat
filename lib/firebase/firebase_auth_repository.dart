import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../presentation/architecture/failures.dart';

/// This is the Auth repository implementation
/// This repository has a dependency from FirebaseAuth
class FirebaseAuthRepository {
  // This dependency will be injected by di(GetIt)
  final FirebaseAuth _auth;

  FirebaseAuthRepository(this._auth);

  Future<Either<Failure, UserCredential>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<void> signOut() async => _auth.signOut();

  User? get currentUser => _auth.currentUser;
}
