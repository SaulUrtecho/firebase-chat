import 'package:firebase_auth/firebase_auth.dart';

/* We need to make our own models because these help us to use 
  an specify type throughout application*/
class UserModel {
  final String email;
  final String uid;
  final String? name;

  UserModel({required this.email, required this.uid, required this.name});

  /* This factory constructor help us to create a new instance for convert 
    the extern data in a User model*/

  factory UserModel.fromUserCredential(UserCredential userCredential) {
    return UserModel(
      email: userCredential.user?.email ?? '',
      uid: userCredential.user?.uid ?? '',
      name: userCredential.user?.displayName,
    );
  }

  factory UserModel.fromCurrentUser(User currentUser) {
    return UserModel(
      email: currentUser.email ?? '',
      uid: currentUser.uid,
      name: currentUser.displayName,
    );
  }
}
