part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final String email;
  final String password;
  final PageState pageState;
  final bool isPasswordVisible;
  final bool isUserValid;

  const SignInState({
    required this.email,
    required this.password,
    required this.pageState,
    required this.isPasswordVisible,
    required this.isUserValid,
  });

  @override
  List<Object> get props => [email, password, pageState, isPasswordVisible, isUserValid];

  bool get isSubmitEnabled => email.isNotEmpty && password.isNotEmpty;

  SignInState copyWith({
    String? email,
    String? password,
    PageState? pageState,
    bool? isPasswordVisible,
    bool? isUserValid,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      pageState: pageState ?? this.pageState,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isUserValid: isUserValid ?? this.isUserValid,
    );
  }

  factory SignInState.initial() {
    return const SignInState(
      email: '',
      password: '',
      pageState: PageState.initial,
      isPasswordVisible: false,
      isUserValid: false,
    );
  }
}
