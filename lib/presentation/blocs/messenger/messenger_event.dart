part of 'messenger_bloc.dart';

abstract class MessengerEvent extends Equatable {
  const MessengerEvent();

  @override
  List<Object> get props => [];
}

class OnMessage extends MessengerEvent {
  final AppMessage message;

  const OnMessage(this.message);

  @override
  String toString() => 'OnMessage';
}

class ClearMessage extends MessengerEvent {
  const ClearMessage();

  @override
  String toString() => 'ClearMessage';
}
