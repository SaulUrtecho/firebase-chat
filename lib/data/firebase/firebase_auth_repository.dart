import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_firestore/data/firebase/models/user_model.dart';

import '../../presentation/architecture/failures.dart';

/// This is the Auth repository implementation
/// This repository has a dependency from FirebaseAuth
class FirebaseAuthRepository {
  // This dependency will be injected by di(GetIt)
  final FirebaseAuth _auth;

  FirebaseAuthRepository(this._auth);

  Future<Either<Failure, UserModel>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      return Right(UserModel.fromUserCredential(result));
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

  Future<Either<ServerFailure, void>> signOut() async {
    try {
      await _auth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  User? get currentUser => _auth.currentUser;
}
