import 'package:either_dart/either.dart';
import 'package:todo_firestore/presentation/architecture/failures.dart';

abstract class InputUseCase<Out, Input> {
  Future<Either<Failure, Out>?> run(Input input);
}

abstract class NoInputUseCase<Out> {
  Future<Either<Failure, Out>?> run();
}
