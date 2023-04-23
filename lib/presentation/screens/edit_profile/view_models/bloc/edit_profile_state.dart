part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  final XFile? avatarFile;
  const EditProfileState({this.avatarFile});

  @override
  List<Object?> get props => [avatarFile];

  EditProfileState copyWith({XFile? avatarFile}) {
    return EditProfileState(avatarFile: avatarFile ?? this.avatarFile);
  }
}
