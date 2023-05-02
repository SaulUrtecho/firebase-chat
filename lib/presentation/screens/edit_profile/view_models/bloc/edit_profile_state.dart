part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  final PageState pageState;
  final XFile? avatarFile;
  final UserModel currentUser;

  const EditProfileState({required this.pageState, this.avatarFile, required this.currentUser});

  @override
  List<Object?> get props => [pageState, avatarFile];

  bool get isSaveButtonEnabled => avatarFile != null;

  EditProfileState copyWith({PageState? pageState, XFile? avatarFile, UserModel? currentUser}) {
    return EditProfileState(
        pageState: pageState ?? this.pageState,
        avatarFile: avatarFile ?? this.avatarFile,
        currentUser: currentUser ?? this.currentUser);
  }

  factory EditProfileState.initial(UserModel currentUser) {
    return EditProfileState(pageState: PageState.initial, currentUser: currentUser);
  }
}
