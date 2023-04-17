part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthStatus authStatus;
  final UserModel? user;

  const AuthenticationState({required this.authStatus, this.user});

  @override
  List<Object?> get props => [authStatus, user];

  AuthenticationState copyWith({AuthStatus? authStatus, UserModel? user}) {
    return AuthenticationState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  }

  factory AuthenticationState.logOut() {
    return const AuthenticationState(authStatus: AuthStatus.loggedOut);
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
