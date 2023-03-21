import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_firestore/data/firebase/firebase_auth_repository.dart';
import 'package:todo_firestore/data/firebase/firestore/firebase_storage_repository.dart';
import 'package:todo_firestore/presentation/screens/sign_in/use_cases/sign_in_use_case.dart';
import 'package:todo_firestore/presentation/screens/sign_in/view_models/sign_in_bloc.dart';
import 'package:todo_firestore/presentation/screens/sign_up/use_cases/sign_up_use_case.dart';
import 'package:todo_firestore/presentation/screens/sign_up/view_models/sign_up_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // First of all we need to register all services that don't depend on other services
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Repositories
  getIt.registerLazySingleton<FirebaseAuthRepository>(() => FirebaseAuthRepository(getIt<FirebaseAuth>()));
  getIt.registerLazySingleton<FirebaseStorageRepository>(() => FirebaseStorageRepository(getIt<FirebaseFirestore>()));

  // Use cases
  getIt.registerFactory<SignUpUseCase>(() => SignUpUseCase(getIt<FirebaseAuthRepository>()));
  getIt.registerFactory<SignInUseCase>(() => SignInUseCase(getIt<FirebaseAuthRepository>()));

  // Blocs
  getIt.registerFactory<SignUpBloc>(() => SignUpBloc(getIt<SignUpUseCase>()));
  getIt.registerFactory<SignInBloc>(() => SignInBloc(getIt<SignInUseCase>()));
}
