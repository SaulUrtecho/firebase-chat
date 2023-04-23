import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_firestore/data/managers/picker_image_manager.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final PickerImageManager _pickerImageManager;

  EditProfileBloc(this._pickerImageManager) : super(const EditProfileState()) {
    on<OnImageSourceSelected>(_onImageSourceSelected);
  }

  Future<void> _onImageSourceSelected(OnImageSourceSelected event, Emitter<EditProfileState> emit) async {
    final avatarFile = await _pickerImageManager.pickImage(event.source);
    emit(state.copyWith(avatarFile: avatarFile));
  }
}
