import 'package:flutter/material.dart';
import 'package:todo_firestore/presentation/pages/chart.dart';
import 'package:todo_firestore/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:todo_firestore/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:todo_firestore/presentation/screens/welcome/welcome_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'welcome',
      routes: {
        'welcome': (context) => const WelcomeScreen(),
        'sign_in': (context) => const SignInScreen(),
        'sign_up': (context) => const SignUpScreen(),
        ChatApp.id: (context) => ChatApp(),
      },
      home: const SignUpScreen(),
    );
  }
}
