import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firestore/data/managers/messenger_manager.dart';

part 'messenger_event.dart';
part 'messenger_state.dart';

class MessengerBloc extends Bloc<MessengerEvent, MessengerState> {
  final MessengerManager _messengerManager;
  late final StreamSubscription _messagesSubscription;

  MessengerBloc(this._messengerManager) : super(const MessengerState()) {
    _messagesSubscription = _messengerManager.messages.listen((message) => add(OnMessage(message)));
    on<OnMessage>((event, emit) => emit(MessengerState(message: event.message)));
    on<ClearMessage>((event, emit) => emit(const MessengerState()));
  }

  @override
  Future<void> close() {
    _messagesSubscription.cancel();
    return super.close();
  }
}
