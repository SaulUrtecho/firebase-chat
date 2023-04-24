import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/data/firebase/auth/firebase_auth_repository.dart';
import 'package:todo_firestore/data/firebase/models/user_model.dart';
import 'package:todo_firestore/presentation/blocs/authentication/use_cases/get_current_user_use_case.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuthRepository _firebaseAuthRepository;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  AuthenticationBloc(this._firebaseAuthRepository, this._getCurrentUserUseCase) : super(AuthenticationState.initial()) {
    on<OnAppStartUp>(onAppStartUp);
    on<OnLogin>(
        (_, emit) => emit(state.copyWith(authStatus: AuthStatus.logged, user: _firebaseAuthRepository.currentUser)));
    on<OnLogOut>((event, emit) => emit(AuthenticationState.logOut()));
  }

  Future<void> onAppStartUp(OnAppStartUp event, Emitter emit) async {
    final currentUser = _firebaseAuthRepository.currentUser;
    if (currentUser != null) {
      final result = await _getCurrentUserUseCase.run();
      if (result.isRight) {
        emit(state.copyWith(authStatus: AuthStatus.logged, user: result.right));
      } else {
        emit(state.copyWith(authStatus: AuthStatus.logged, user: currentUser));
      }
    } else {
      emit(AuthenticationState.logOut());
    }
  }
}
