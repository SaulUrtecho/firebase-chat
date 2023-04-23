part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

class OnImageSourceSelected extends EditProfileEvent {
  final ImageSource source;

  const OnImageSourceSelected(this.source);

  @override
  String toString() => 'OnImageSourceSelected';
}
