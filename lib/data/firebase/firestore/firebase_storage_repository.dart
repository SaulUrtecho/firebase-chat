import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:todo_firestore/data/firebase/firestore/firestore_constants.dart';
import 'package:todo_firestore/data/firebase/models/message_model.dart';
import 'package:todo_firestore/presentation/architecture/failures.dart';

/// This is Storage repository implementation
/// This repository has a dependency from FirebaseFirestore
class FirebaseStorageRepository {
  // This dependency will be injected by di(GetIt)
  final FirebaseFirestore _store;

  FirebaseStorageRepository(this._store);

  Stream<List<MessageModel>> watchMessages() {
    return _store
        .collection(messagesCollection)
        .orderBy(orderByCreated, descending: true)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((e) => e.data()).map(MessageModel.fromJson).toList());
  }

  Future<Either<ServerFailure, void>> saveMessage(MessageModel message) async {
    try {
      await _store.collection(messagesCollection).doc().set(message.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
