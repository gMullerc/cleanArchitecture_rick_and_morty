import 'package:either_dart/either.dart';
import 'package:rick_and_morty/core/usecase/errors/failures.dart';
import 'package:rick_and_morty/core/usecase/usecase.dart';
import 'package:rick_and_morty/features/domain/entities/characters.dart';
import 'package:rick_and_morty/features/domain/repositories/characters_repository.dart';

class GetCharactersList implements UseCase<CharactersEntity, NoParams> {
  final ICharactersRepository repository;

  GetCharactersList(this.repository);

  @override
  Future<Either<Failure, CharactersEntity>> call(NoParams noParams) async {
    var charactersList = await repository.getCharactersList();

    return charactersList.isRight ? charactersList : Left(ServerFailure());
  }
}
