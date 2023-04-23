import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/data/firebase/models/user_model.dart';
import 'package:todo_firestore/presentation/architecture/page_state.dart';
import 'package:todo_firestore/presentation/screens/sign_up/use_cases/create_user_use_case.dart';
import 'package:todo_firestore/presentation/screens/sign_up/use_cases/sign_up_use_case.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;
  final CreateUserUseCase _createUserUseCase;

  SignUpBloc(this._signUpUseCase, this._createUserUseCase) : super(SignUpState.initial()) {
    on<OnEmailChanged>((event, emit) => emit(state.copyWith(email: event.email.trim())));
    on<OnPasswordChanged>((event, emit) => emit(state.copyWith(password: event.password.trim())));
    on<OnSignUpPressed>(_onSignUpPressed);
  }

  Future<void> _onSignUpPressed(OnSignUpPressed event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(pageState: PageState.loading));
    final result = await _signUpUseCase.run(SignUpInput(state.email, state.password));
    if (result.isRight) {
      final result2 = await _createUserUseCase.run(UserModel(id: '', uid: '', email: state.email));
      if (result2.isRight) {
        emit(state.copyWith(isUserCreated: true));
      } else {
        emit(state.copyWith(pageState: PageState.failure));
      }
    } else {
      emit(state.copyWith(pageState: PageState.failure));
    }
  }
}
