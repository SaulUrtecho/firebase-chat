import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firestore/firebase/firestore/firestore_constants.dart';

/// This is Storage repository implementation
/// This repository has a dependency from FirebaseFirestore
class FirebaseStorageRepository {
  // This dependency will be injected by di(GetIt)
  final FirebaseFirestore _store;

  FirebaseStorageRepository(this._store);

  Stream<QuerySnapshot<Map<String, dynamic>>> watchMessages() {
    return _store.collection(messagesCollection).orderBy(orderByCreated, descending: true).snapshots();
  }

  Future<DocumentReference<Map<String, dynamic>>> saveMessage(Map<String, dynamic> message) async {
    return _store.collection(messagesCollection).add(message);
  }
}
