import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/core/usecase/errors/failures.dart';

abstract class UseCase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
