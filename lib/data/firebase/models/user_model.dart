import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/* We need to make our own models because these help us to use
  an specify type throughout application*/
class UserModel {
  final String id;
  final String uid;
  final String email;
  final String? name;
  final String? avatar;

  UserModel({required this.id, required this.uid, required this.email, this.name, this.avatar});

  /* This factory constructor help us to create a new instance for convert
    the extern data in a User model*/

  factory UserModel.fromFirebaseUserCredential(UserCredential userCredential) {
    return UserModel(
      id: '',
      email: userCredential.user?.email ?? '',
      uid: userCredential.user?.uid ?? '',
      name: userCredential.user?.displayName,
    );
  }

  factory UserModel.fromFirebaseUser(User currentUser) {
    return UserModel(
      id: '',
      email: currentUser.email ?? '',
      uid: currentUser.uid,
      name: currentUser.displayName,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['name'] = name;
    data['avatar'] = avatar;
    return data;
  }

  factory UserModel.fromQueryDocument(QueryDocumentSnapshot<Map<String, dynamic>> queryDoc) {
    final data = queryDoc.data();
    return UserModel(
      id: queryDoc.id,
      uid: data['uid'],
      email: data['email'],
      name: data['name'],
      avatar: data['avatar'],
    );
  }
}
