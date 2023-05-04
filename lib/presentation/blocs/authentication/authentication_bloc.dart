import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/data/firebase/auth/firebase_auth_repository.dart';
import 'package:todo_firestore/data/firebase/firestore/firebase_firestore_repository.dart';
import 'package:todo_firestore/data/firebase/models/user_model.dart';
import 'package:todo_firestore/presentation/blocs/authentication/use_cases/get_current_user_use_case.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuthRepository _firebaseAuthRepository;
  final FirebaseFirestoreRepository _firebaseFirestoreRepository;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  late final StreamSubscription _userSubscription;

  AuthenticationBloc(
    this._firebaseAuthRepository,
    this._getCurrentUserUseCase,
    this._firebaseFirestoreRepository,
  ) : super(AuthenticationState.initial()) {
    _userSubscription = _firebaseFirestoreRepository.userStream.listen((user) => add(UserUpdated(user)));
    on<OnAppStartUp>(onAppStartUp);
    on<OnLogin>(
        (_, emit) => emit(state.copyWith(authStatus: AuthStatus.logged, user: _firebaseAuthRepository.currentUser)));
    on<OnLogOut>((event, emit) => emit(AuthenticationState.logOut()));
    on<UserUpdated>((event, emit) => emit(state.copyWith(user: event.user)));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
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
