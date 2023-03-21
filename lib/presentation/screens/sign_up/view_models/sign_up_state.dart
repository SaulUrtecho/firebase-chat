part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final String email;
  final String password;
  final PageState pageState;
  final bool isUserCreated;

  const SignUpState({
    required this.email,
    required this.password,
    required this.pageState,
    required this.isUserCreated,
  });

  @override
  List<Object> get props => [email, password, pageState, isUserCreated];

  bool get isSubmitEnabled => email.isNotEmpty && password.isNotEmpty;

  SignUpState copyWith({String? email, String? password, PageState? pageState, bool? isUserCreated}) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      pageState: pageState ?? this.pageState,
      isUserCreated: isUserCreated ?? this.isUserCreated,
    );
  }

  factory SignUpState.initial() {
    return const SignUpState(
      email: '',
      password: '',
      pageState: PageState.initial,
      isUserCreated: false,
    );
  }
}
