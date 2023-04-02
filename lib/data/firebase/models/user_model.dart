import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String email;
  final String uid;

  UserModel({required this.email, required this.uid});

  factory UserModel.fromUserCredential(UserCredential userCredential) {
    return UserModel(
      email: userCredential.user?.email ?? '',
      uid: userCredential.user?.uid ?? '',
    );
  }

  factory UserModel.fromCurrentUser(User currentUser) {
    return UserModel(
      email: currentUser.email ?? '',
      uid: currentUser.uid,
    );
  }
}
