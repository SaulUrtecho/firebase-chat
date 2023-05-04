part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class OnAppStartUp extends AuthenticationEvent {
  const OnAppStartUp();

  @override
  String toString() => 'OnAppStartUp';
}

class OnLogin extends AuthenticationEvent {
  const OnLogin();

  @override
  String toString() => 'OnLogin';
}

class OnLogOut extends AuthenticationEvent {
  const OnLogOut();

  @override
  String toString() => 'OnLogOut';
}

class UserUpdated extends AuthenticationEvent {
  final UserModel user;

  const UserUpdated(this.user);

  @override
  String toString() => 'UserUpdated';
}
