import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/data/firebase/firebase_auth_repository.dart';
import 'package:todo_firestore/data/firebase/firestore/firebase_storage_repository.dart';
import 'package:todo_firestore/data/firebase/models/message_model.dart';
import 'package:todo_firestore/presentation/architecture/page_state.dart';
import 'package:todo_firestore/presentation/screens/chat/use_cases/send_message_use_case.dart';
import 'package:todo_firestore/presentation/screens/chat/use_cases/sign_out_use_case.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FirebaseAuthRepository _firebaseAuthRepository;
  final FirebaseStorageRepository _firebaseStorageRepository;
  final SendMessageUseCase _sendMessageUseCase;
  final SignOutUseCase _signOutUseCase;
  late final StreamSubscription _messagesListener;

  ChatBloc(
    this._firebaseAuthRepository,
    this._sendMessageUseCase,
    this._signOutUseCase,
    this._firebaseStorageRepository,
  ) : super(ChatState.initial()) {
    _messagesListener =
        _firebaseStorageRepository.watchMessages().listen((messages) => add(OnMessagesUpdated(messages)));
    on<OnMessagesUpdated>((event, emit) => emit(state.copyWith(messages: event.messages)));
    on<OnSignOut>(_onSignOut);
  }

  Future<void> _onSignOut(OnSignOut event, Emitter<ChatState> emit) async {
    final result = await _signOutUseCase.run();
    if (result.isRight) {
      emit(state.copyWith(isLogedOut: true));
    } else {
      emit(state.copyWith(pageState: PageState.failure));
    }
  }

  @override
  Future<void> close() async {
    await _messagesListener.cancel();
    return super.close();
  }
}
