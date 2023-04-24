import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_firestore/data/firebase/auth/firebase_auth_repository.dart';
import 'package:todo_firestore/data/firebase/firestore/firebase_firestore_repository.dart';
import 'package:todo_firestore/data/firebase/storage/storage_repository.dart';
import 'package:todo_firestore/data/managers/picker_image_manager.dart';
import 'package:todo_firestore/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:todo_firestore/presentation/blocs/authentication/use_cases/get_current_user_use_case.dart';
import 'package:todo_firestore/presentation/screens/chat/use_cases/delete_message_use_case.dart';
import 'package:todo_firestore/presentation/screens/chat/use_cases/update_message_use_case.dart';
import 'package:todo_firestore/presentation/screens/chat/use_cases/send_message_use_case.dart';
import 'package:todo_firestore/presentation/screens/chat/use_cases/sign_out_use_case.dart';
import 'package:todo_firestore/presentation/screens/chat/view_models/chat_bloc.dart';
import 'package:todo_firestore/presentation/screens/edit_profile/use_cases/upload_file_use_case.dart';
import 'package:todo_firestore/presentation/screens/edit_profile/view_models/bloc/edit_profile_bloc.dart';
import 'package:todo_firestore/presentation/screens/sign_in/use_cases/sign_in_use_case.dart';
import 'package:todo_firestore/presentation/screens/sign_in/view_models/sign_in_bloc.dart';
import 'package:todo_firestore/presentation/screens/sign_up/use_cases/create_user_use_case.dart';
import 'package:todo_firestore/presentation/screens/sign_up/use_cases/sign_up_use_case.dart';
import 'package:todo_firestore/presentation/screens/sign_up/view_models/sign_up_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // First of all we need to register all services that don't depend on other services
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  // Managers
  getIt.registerFactory<PickerImageManager>(() => PickerImageManager());

  // Repositories
  getIt.registerLazySingleton<FirebaseAuthRepository>(() => FirebaseAuthRepository(getIt<FirebaseAuth>()));
  getIt.registerLazySingleton<FirebaseFirestoreRepository>(
      () => FirebaseFirestoreRepository(getIt<FirebaseFirestore>(), getIt<FirebaseAuthRepository>()));
  getIt.registerLazySingleton<StorageRepository>(() => StorageRepository(getIt<FirebaseStorage>()));

  // Use cases
  getIt.registerFactory<SignUpUseCase>(() => SignUpUseCase(getIt<FirebaseAuthRepository>()));
  getIt.registerFactory<SignInUseCase>(() => SignInUseCase(getIt<FirebaseAuthRepository>()));
  getIt.registerFactory<SendMessageUseCase>(() => SendMessageUseCase(getIt<FirebaseFirestoreRepository>()));
  getIt.registerFactory<SignOutUseCase>(() => SignOutUseCase(getIt<FirebaseAuthRepository>()));
  getIt.registerFactory<DeleteMessageUseCase>(() => DeleteMessageUseCase(getIt<FirebaseFirestoreRepository>()));
  getIt.registerFactory<UpdateMessageUseCase>(() => UpdateMessageUseCase(getIt<FirebaseFirestoreRepository>()));
  getIt.registerFactory<UploadFileUseCase>(() => UploadFileUseCase(getIt<StorageRepository>()));
  getIt.registerFactory<CreateUserUseCase>(() => CreateUserUseCase(getIt<FirebaseFirestoreRepository>()));
  getIt.registerFactory<GetCurrentUserUseCase>(() => GetCurrentUserUseCase(getIt<FirebaseFirestoreRepository>()));

  // Blocs
  getIt.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(getIt<FirebaseAuthRepository>(), getIt<GetCurrentUserUseCase>()));
  getIt.registerFactory<SignUpBloc>(() => SignUpBloc(getIt<SignUpUseCase>(), getIt<CreateUserUseCase>()));
  getIt.registerFactory<SignInBloc>(() => SignInBloc(getIt<SignInUseCase>()));
  getIt.registerFactory<ChatBloc>(
    () => ChatBloc(
      getIt<FirebaseAuthRepository>(),
      getIt<SendMessageUseCase>(),
      getIt<SignOutUseCase>(),
      getIt<FirebaseFirestoreRepository>(),
      getIt<DeleteMessageUseCase>(),
      getIt<UpdateMessageUseCase>(),
    ),
  );
  getIt.registerFactory<EditProfileBloc>(() => EditProfileBloc(getIt<PickerImageManager>()));
}
