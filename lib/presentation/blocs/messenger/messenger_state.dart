part of 'messenger_bloc.dart';

class MessengerState extends Equatable {
  final AppMessage? message;
  const MessengerState({this.message});

  @override
  List<Object?> get props => [message];
}
