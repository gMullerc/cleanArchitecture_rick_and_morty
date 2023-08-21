import 'package:either_dart/either.dart';
import 'package:rick_and_morty/core/usecase/errors/exceptions.dart';
import 'package:rick_and_morty/core/usecase/errors/failures.dart';
import 'package:rick_and_morty/features/data/datasource/characters_datasource.dart';
import 'package:rick_and_morty/features/domain/entities/characters.dart';
import 'package:rick_and_morty/features/domain/repositories/characters_repository.dart';

class CharactersRepositoryImp implements ICharactersRepository {
  final ICharactersDataSource datasource;

  CharactersRepositoryImp({required this.datasource});

  @override
  Future<Either<Failure, CharactersEntity>> getCharactersList() async {
    try {
      final result = await datasource.getCharacters();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
