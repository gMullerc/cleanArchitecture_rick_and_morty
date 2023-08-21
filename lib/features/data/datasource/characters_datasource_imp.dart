import 'dart:convert';

import 'package:rick_and_morty/core/usecase/errors/exceptions.dart';
import 'package:rick_and_morty/features/data/datasource/characters_datasource.dart';
import 'package:rick_and_morty/features/data/datasource/endpoints/rick_and_morty_endpoints.dart';
import 'package:rick_and_morty/features/data/models/characters_model.dart';
import 'package:http/http.dart' as http;

class CharactersDataSourceImp implements ICharactersDataSource {
  final http.Client client;
  CharactersDataSourceImp({required this.client});

  @override
  Future<CharactersModel> getCharacters() async {
    final response = await client.get(RickAndMortyEndpoints.getCharactesList());

    if (response.statusCode == 200) {
      return CharactersModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
