import 'package:either_dart/either.dart';
import 'package:rick_and_morty/core/usecase/errors/failures.dart';
import 'package:rick_and_morty/features/domain/entities/characters.dart';

abstract class ICharactersRepository {
  Future<Either<Failure, CharactersEntity>> getCharactersList();
}
