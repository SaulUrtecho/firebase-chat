import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:todo_firestore/data/firebase/auth/firebase_auth_repository.dart';
import 'package:todo_firestore/data/firebase/firestore/firestore_constants.dart';
import 'package:todo_firestore/data/firebase/models/message_model.dart';
import 'package:todo_firestore/data/firebase/models/user_model.dart';
import 'package:todo_firestore/presentation/architecture/failures.dart';

/// This is Storage repository implementation
/// This repository has a dependency from FirebaseFirestore
class FirebaseFirestoreRepository {
  // This dependency will be injected by di(GetIt)
  final FirebaseFirestore _store;
  final FirebaseAuthRepository _auth;

  FirebaseFirestoreRepository(this._store, this._auth);

  Future<Either<ServerFailure, String>> createUser(UserModel user) async {
    final userCollection = _store.collection(usersCollection);
    final uid = _auth.userUid;
    return userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(id: '', name: user.name, uid: uid!, email: user.email, avatar: user.avatar).toJson();
      if (!userDoc.exists) {
        return userCollection
            .doc(uid)
            .set(newUser)
            .then((value) => const Right('user created'), onError: (e) => Left(ServerFailure()));
      } else {
        return userCollection
            .doc(uid)
            .update(newUser)
            .then((value) => const Right('user already exist'), onError: (e) => Left(ServerFailure()));
      }
    }, onError: (e) => Left(ServerFailure()));
  }

  Future<Either<ServerFailure, UserModel>> getCurrentUser() async {
    return _store.collection(usersCollection).where('uid', isEqualTo: _auth.userUid).limit(1).get().then(
          (snapshot) => Right(UserModel.fromQueryDocument(snapshot.docs.first)),
          onError: (e) => Left(ServerFailure()),
        );
  }

  Future<Either<ServerFailure, void>> updateUser(UserModel user) async {
    return _store.collection(usersCollection).doc(user.id).update(user.toJson()).then(
          (doc) => const Right(null),
          onError: (e) => Left(ServerFailure()),
        );
  }

  Stream<List<MessageModel>> watchMessages() {
    return _store
        .collection(messagesCollection)
        .orderBy(orderByCreated, descending: true)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((e) => MessageModel.fromQueryDocument(e)).toList());
  }

  Future<Either<ServerFailure, void>> saveMessage(MessageModel message) async {
    return _store.collection(messagesCollection).doc().set(message.toJson()).then(
          (doc) => const Right(null),
          onError: (e) => Left(ServerFailure()),
        );
  }

  // todo!!!
  Future<Either<ServerFailure, void>> updateMessage(MessageModel message) async {
    return _store.collection(messagesCollection).doc(message.id).update(message.toJson()).then(
          (doc) => const Right(null),
          onError: (e) => Left(ServerFailure()),
        );
  }

  Future<Either<ServerFailure, void>> deleteMessage(String messageId) async {
    return _store.collection(messagesCollection).doc(messageId).delete().then(
          (doc) => const Right(null),
          onError: (e) => Left(ServerFailure()),
        );
  }
}
