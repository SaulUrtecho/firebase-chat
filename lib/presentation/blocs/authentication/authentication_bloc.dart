import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/data/firebase/firebase_auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuthRepository _firebaseAuthRepository;

  AuthenticationBloc(this._firebaseAuthRepository) : super(AuthenticationState.initial()) {
    on<OnAppStartUp>(onAppStartUp);
    on<OnLogin>((_, emit) => emit(state.copyWith(authStatus: AuthStatus.logged)));
    on<OnLogOut>((event, emit) => emit(state.copyWith(authStatus: AuthStatus.loggedOut)));
  }

  void onAppStartUp(OnAppStartUp event, Emitter emit) {
    if (_firebaseAuthRepository.currentUser != null) {
      emit(state.copyWith(authStatus: AuthStatus.logged));
    } else {
      emit(state.copyWith(authStatus: AuthStatus.loggedOut));
    }
  }
}
