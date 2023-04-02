import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/presentation/architecture/page_state.dart';
import 'package:todo_firestore/presentation/screens/sign_in/use_cases/sign_in_use_case.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase _signInUseCase;

  SignInBloc(this._signInUseCase) : super(SignInState.initial()) {
    on<OnEmailChanged>((event, emit) => emit(state.copyWith(email: event.email.trim())));
    on<OnPasswordChanged>((event, emit) => emit(state.copyWith(password: event.password.trim())));
    on<OnTooglePasswordVisible>(_onTooglePasswordVisible);
    on<OnSignInPressed>(_onSignInPressed);
  }

  void _onTooglePasswordVisible(OnTooglePasswordVisible event, Emitter<SignInState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _onSignInPressed(OnSignInPressed event, Emitter<SignInState> emit) async {
    emit(state.copyWith(pageState: PageState.loading));
    final result = await _signInUseCase.run(SignInInput(state.email, state.password));
    if (result.isRight) {
      emit(state.copyWith(isUserValid: true));
    } else {
      emit(state.copyWith(pageState: PageState.failure));
    }
  }
}
