import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty/core/usecase/errors/failures.dart';
import 'package:rick_and_morty/core/usecase/usecase.dart';
import 'package:rick_and_morty/features/domain/entities/characters.dart';
import 'package:rick_and_morty/features/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty/features/domain/usecases/get_characters_list.dart';

import '../../mocks/characters_list_entity_mock.dart';

class MockCharactersRepository extends Mock implements ICharactersRepository {}

void main() {
  late GetCharactersList usecase;
  late ICharactersRepository repository;

  setUp(() {
    repository = MockCharactersRepository();
    usecase = GetCharactersList(repository);
  });

  test('should get characters entity from the repository', () async {
    when(
      () => repository.getCharactersList(),
    ).thenAnswer((_) async => Right<Failure, CharactersEntity>(tCharacters));

    final result = await usecase(NoParams());

    expect(result, Right<Failure, CharactersEntity>(tCharacters));
  });
}
