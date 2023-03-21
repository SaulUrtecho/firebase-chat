part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class OnEmailChanged extends SignUpEvent {
  final String email;

  const OnEmailChanged(this.email);

  @override
  String toString() => 'OnEmailChange: $email';
}

class OnPasswordChanged extends SignUpEvent {
  final String password;

  const OnPasswordChanged(this.password);

  @override
  String toString() => 'OnPasswordChange: $password';
}

class OnSignUpPressed extends SignUpEvent {
  const OnSignUpPressed();
  @override
  String toString() => 'OnSignUpPressed';
}
