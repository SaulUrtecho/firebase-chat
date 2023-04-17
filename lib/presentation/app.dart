import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_firestore/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:todo_firestore/presentation/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // we created a navigatorKey for access to Navigator stack
    // without needing a reference to the BuildContext
    final navigatorKey = GlobalKey<NavigatorState>();
    return BlocProvider(
      create: (_) => GetIt.I.get<AuthenticationBloc>()..add(const OnAppStartUp()),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateRoute: onGenerateRoute,
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.authStatus) {
                case AuthStatus.logged:
                  navigatorKey.currentState!.pushNamedAndRemoveUntil(Routes.chat, (route) => false);
                  break;
                case AuthStatus.initial:
                case AuthStatus.loggedOut:
                  navigatorKey.currentState!.pushNamedAndRemoveUntil(Routes.welcome, (route) => false);
                  break;
              }
            },
            child: child,
          );
        },
      ),
    );
  }
}
