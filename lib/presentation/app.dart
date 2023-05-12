import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_firestore/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:todo_firestore/presentation/blocs/messenger/messenger_bloc.dart';
import 'package:todo_firestore/presentation/design/snackbar/app_snackbar.dart';
import 'package:todo_firestore/presentation/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.I.get<AuthenticationBloc>()..add(const OnAppStartUp()),
        ),
        BlocProvider(create: (_) => GetIt.I.get<MessengerBloc>()),
      ],
      child: BlocListener<MessengerBloc, MessengerState>(
        listenWhen: (_, current) => current.message != null,
        listener: (context, state) {
          AppSnackbar(scaffoldKey.currentState!, state.message!.title, state.message!.type).show();
          context.read<MessengerBloc>().add(const ClearMessage());
        },
        child: MaterialApp(
          scaffoldMessengerKey: scaffoldKey,
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
      ),
    );
  }
}
