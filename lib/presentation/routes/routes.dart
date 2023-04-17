import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_firestore/presentation/screens/chat/chat_screen.dart';
import 'package:todo_firestore/presentation/screens/edit_profile/edit_profile_screen.dart';
import 'package:todo_firestore/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:todo_firestore/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:todo_firestore/presentation/screens/welcome/welcome_screen.dart';

// route names
class Routes {
  static const welcome = 'welcome';
  static const signIn = 'sign_in';
  static const signUp = 'sign_up';
  static const chat = 'chat';
  static const editProfile = 'edit_profile';
}

// for android routes
final materialRoutes = <String, Widget Function(BuildContext)>{
  Routes.welcome: (context) => const WelcomeScreen(),
  Routes.signIn: (context) => const SignInScreen(),
  Routes.signUp: (context) => const SignUpScreen(),
  Routes.chat: (context) => const ChatScreen(),
  Routes.editProfile: (context) => const EditProfileScreen(),
};

// for ios
final cupertinoRoutes = <String, Widget Function(BuildContext)>{};

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  if (materialRoutes.containsKey(settings.name)) {
    return MaterialPageRoute(
      builder: materialRoutes[settings.name]!,
    );
  } else if (cupertinoRoutes.containsKey(settings.name)) {
    return CupertinoPageRoute(
      builder: cupertinoRoutes[settings.name]!,
    );
  } else {
    return MaterialPageRoute(
      builder: (context) => const SizedBox.shrink(),
    );
  }
}
