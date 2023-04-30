part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  final PageState pageState;
  final XFile? avatarFile;

  const EditProfileState({required this.pageState, this.avatarFile});

  @override
  List<Object?> get props => [pageState, avatarFile];

  bool get isSaveButtonEnabled => avatarFile != null;

  EditProfileState copyWith({PageState? pageState, XFile? avatarFile}) {
    return EditProfileState(
      pageState: pageState ?? this.pageState,
      avatarFile: avatarFile ?? this.avatarFile,
    );
  }

  factory EditProfileState.initial() {
    return const EditProfileState(pageState: PageState.initial);
  }
}
