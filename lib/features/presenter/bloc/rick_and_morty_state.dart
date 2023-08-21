import 'package:rick_and_morty/features/domain/entities/characters.dart';

abstract class RickAndMortyCharactersState {
  final CharactersEntity characters;
  const RickAndMortyCharactersState({required this.characters});
}

class RickAndMortyStateLoading extends RickAndMortyCharactersState {
  RickAndMortyStateLoading()
      : super(characters: CharactersEntity.noAttributes());
}

class RickAndMortyStateLoaded extends RickAndMortyCharactersState {
  final CharactersEntity characters;

  RickAndMortyStateLoaded({required this.characters})
      : super(characters: characters);
}

class RickAndMortyStateError extends RickAndMortyCharactersState {
  final String errorMessage;

  RickAndMortyStateError(this.errorMessage)
      : super(characters: CharactersEntity.noAttributes());
}

class RickAndMortyStateInitial extends RickAndMortyCharactersState {
  RickAndMortyStateInitial()
      : super(characters: CharactersEntity.noAttributes());
}
