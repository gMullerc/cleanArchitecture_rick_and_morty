import 'package:rick_and_morty/features/domain/entities/characters.dart';

abstract class ICharactersDataSource {
  Future<CharactersEntity> getCharacters();
}
