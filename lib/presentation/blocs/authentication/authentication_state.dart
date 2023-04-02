part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthStatus authStatus;
  const AuthenticationState({required this.authStatus});

  @override
  List<Object> get props => [authStatus];

  AuthenticationState copyWith({AuthStatus? authStatus}) {
    return AuthenticationState(authStatus: authStatus ?? this.authStatus);
  }

  factory AuthenticationState.initial() {
    return const AuthenticationState(authStatus: AuthStatus.initial);
  }
}

enum AuthStatus {
  initial,
  logged,
  loggedOut,
}
