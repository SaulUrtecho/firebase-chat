part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final String email;
  final String password;
  final PageState pageState;
  final bool isPasswordVisible;
  final bool isUserCreated;

  const SignInState({
    required this.email,
    required this.password,
    required this.pageState,
    required this.isPasswordVisible,
    required this.isUserCreated,
  });

  @override
  List<Object> get props => [email, password, pageState, isPasswordVisible, isUserCreated];

  bool get isSubmitEnabled => email.isNotEmpty && password.isNotEmpty;

  SignInState copyWith({
    String? email,
    String? password,
    PageState? pageState,
    bool? isPasswordVisible,
    bool? isUserCreated,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      pageState: pageState ?? this.pageState,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isUserCreated: isUserCreated ?? this.isUserCreated,
    );
  }

  factory SignInState.initial() {
    return const SignInState(
      email: '',
      password: '',
      pageState: PageState.initial,
      isPasswordVisible: false,
      isUserCreated: false,
    );
  }
}
