import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_firestore/data/managers/picker_image_manager.dart';
import 'package:todo_firestore/presentation/architecture/page_state.dart';
import 'package:todo_firestore/presentation/screens/edit_profile/use_cases/upload_file_use_case.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final PickerImageManager _pickerImageManager;
  final UploadFileUseCase _uploadFileUseCase;

  EditProfileBloc(this._pickerImageManager, this._uploadFileUseCase) : super(EditProfileState.initial()) {
    on<OnImageSourceSelected>(_onImageSourceSelected);
    on<OnSaveButtonPressed>(_onSaveButtonPressed);
  }

  Future<void> _onImageSourceSelected(OnImageSourceSelected event, Emitter<EditProfileState> emit) async {
    final avatarFile = await _pickerImageManager.pickImage(event.source);
    emit(state.copyWith(avatarFile: avatarFile));
  }

  Future<void> _onSaveButtonPressed(OnSaveButtonPressed event, Emitter<EditProfileState> emit) async {
    emit(state.copyWith(pageState: PageState.loading));
    final result = await _uploadFileUseCase.run(File(state.avatarFile!.path));
    if (result.isRight) {
      emit(state.copyWith(pageState: PageState.success));
      print(result.right);
      // todo: create a model for pass the image url
    } else {
      emit(state.copyWith(pageState: PageState.failure));
    }
  }
}
