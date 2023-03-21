part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class OnEmailChanged extends SignInEvent {
  final String email;

  const OnEmailChanged(this.email);

  @override
  String toString() => 'OnEmailChange: $email';
}

class OnPasswordChanged extends SignInEvent {
  final String password;

  const OnPasswordChanged(this.password);

  @override
  String toString() => 'OnPasswordChange: $password';
}

class OnTooglePasswordVisible extends SignInEvent {
  const OnTooglePasswordVisible();
  @override
  String toString() => 'OnTooglePasswordVisible';
}

class OnSignInPressed extends SignInEvent {
  const OnSignInPressed();
  @override
  String toString() => 'OnSignInPressed';
}
