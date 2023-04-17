import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:todo_firestore/data/firebase/storage/storage_repository.dart';
import 'package:todo_firestore/presentation/architecture/failures.dart';
import 'package:todo_firestore/presentation/architecture/use_cases.dart';

class UploadFileUseCase implements InputUseCase<String, File> {
  final StorageRepository _storageRepository;

  UploadFileUseCase(this._storageRepository);

  @override
  Future<Either<Failure, String>> run(File input) {
    return _storageRepository.uploadFile(input);
  }
}
