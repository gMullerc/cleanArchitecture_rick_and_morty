import 'dart:async';

import 'package:rick_and_morty/core/usecase/usecase.dart';
import 'package:rick_and_morty/features/data/datasource/characters_datasource_imp.dart';
import 'package:rick_and_morty/features/data/repositories/characters_repository_imp.dart';
import 'package:rick_and_morty/features/domain/usecases/get_characters_list.dart';
import 'package:rick_and_morty/features/presenter/bloc/rick_and_morty_event.dart';
import 'package:rick_and_morty/features/presenter/bloc/rick_and_morty_state.dart';
import 'package:http/http.dart' as http;

class RickAndMortyBloc {
  final StreamController<RickAndMortyEvent> _inputCharactersController =
      StreamController<RickAndMortyEvent>();
  final StreamController<RickAndMortyCharactersState>
      _outputCharactersController =
      StreamController<RickAndMortyCharactersState>();

  Sink<RickAndMortyEvent> get inputCharactersController =>
      _inputCharactersController.sink;

  Stream<RickAndMortyCharactersState> get outputCharactersController =>
      _outputCharactersController.stream;
  RickAndMortyBloc() {
    _inputCharactersController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(RickAndMortyEvent event) async {
    _outputCharactersController.add(RickAndMortyStateLoading());

    if (event is GetRickAndMortyCharacterEvent) {
      final client = http.Client();
      final charactersDataSourceImp = CharactersDataSourceImp(client: client);
      final charactersRepository =
          CharactersRepositoryImp(datasource: charactersDataSourceImp);
      final getCharactersList = GetCharactersList(charactersRepository);

      final charactersEither = await getCharactersList.call(NoParams());

      charactersEither.fold(
          (failure) => _outputCharactersController
              .add(RickAndMortyStateError(failure.toString())),
          (characters) => _outputCharactersController
              .add(RickAndMortyStateLoaded(characters: characters)));
    }
  }
}
