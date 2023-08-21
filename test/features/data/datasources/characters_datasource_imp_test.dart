import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/core/usecase/errors/exceptions.dart';
import 'package:rick_and_morty/features/data/datasource/characters_datasource_imp.dart';
import 'package:rick_and_morty/features/data/models/character_location_model.dart';
import 'package:rick_and_morty/features/data/models/character_model.dart';
import 'package:rick_and_morty/features/data/models/character_origin_model.dart';
import 'package:rick_and_morty/features/data/models/characters_model.dart';
import 'package:rick_and_morty/features/data/models/info_model.dart';

import '../../mocks/characters_mock.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late CharactersDataSourceImp dataSource;
  late http.Client client;

  setUp(() {
    client = MockClient();
    dataSource = CharactersDataSourceImp(client: client);
    registerFallbackValue(Uri());
  });
  final tCharactersModel = CharactersModel(
      info: InfoModel(
          count: 826,
          pages: 42,
          next: "https://rickandmortyapi.com/api/character/?page=2",
          prev: null),
      character: [
        CharacterModel(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: CharacterOriginModel(
                name: "Earth (C-137)",
                url: "https://rickandmortyapi.com/api/location/1"),
            location: CharacterLocationModel(
                name: 'Citadel of Ricks',
                url: "https://rickandmortyapi.com/api/location/3"),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: const [
              "https://rickandmortyapi.com/api/episode/1",
              "https://rickandmortyapi.com/api/episode/2",
              "https://rickandmortyapi.com/api/episode/3",
              "https://rickandmortyapi.com/api/episode/4",
              "https://rickandmortyapi.com/api/episode/5",
              "https://rickandmortyapi.com/api/episode/6",
              "https://rickandmortyapi.com/api/episode/7",
              "https://rickandmortyapi.com/api/episode/8",
              "https://rickandmortyapi.com/api/episode/9",
              "https://rickandmortyapi.com/api/episode/10",
              "https://rickandmortyapi.com/api/episode/11",
              "https://rickandmortyapi.com/api/episode/12",
              "https://rickandmortyapi.com/api/episode/13",
              "https://rickandmortyapi.com/api/episode/14",
              "https://rickandmortyapi.com/api/episode/15",
              "https://rickandmortyapi.com/api/episode/16",
              "https://rickandmortyapi.com/api/episode/17",
              "https://rickandmortyapi.com/api/episode/18",
              "https://rickandmortyapi.com/api/episode/19",
              "https://rickandmortyapi.com/api/episode/20",
              "https://rickandmortyapi.com/api/episode/21",
              "https://rickandmortyapi.com/api/episode/22",
              "https://rickandmortyapi.com/api/episode/23",
              "https://rickandmortyapi.com/api/episode/24",
              "https://rickandmortyapi.com/api/episode/25",
              "https://rickandmortyapi.com/api/episode/26",
              "https://rickandmortyapi.com/api/episode/27",
              "https://rickandmortyapi.com/api/episode/28",
              "https://rickandmortyapi.com/api/episode/29",
              "https://rickandmortyapi.com/api/episode/30",
              "https://rickandmortyapi.com/api/episode/31",
              "https://rickandmortyapi.com/api/episode/32",
              "https://rickandmortyapi.com/api/episode/33",
              "https://rickandmortyapi.com/api/episode/34",
              "https://rickandmortyapi.com/api/episode/35",
              "https://rickandmortyapi.com/api/episode/36",
              "https://rickandmortyapi.com/api/episode/37",
              "https://rickandmortyapi.com/api/episode/38",
              "https://rickandmortyapi.com/api/episode/39",
              "https://rickandmortyapi.com/api/episode/40",
              "https://rickandmortyapi.com/api/episode/41",
              "https://rickandmortyapi.com/api/episode/42",
              "https://rickandmortyapi.com/api/episode/43",
              "https://rickandmortyapi.com/api/episode/44",
              "https://rickandmortyapi.com/api/episode/45",
              "https://rickandmortyapi.com/api/episode/46",
              "https://rickandmortyapi.com/api/episode/47",
              "https://rickandmortyapi.com/api/episode/48",
              "https://rickandmortyapi.com/api/episode/49",
              "https://rickandmortyapi.com/api/episode/50",
              "https://rickandmortyapi.com/api/episode/51"
            ],
            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z")
      ]);

  void successMock() {
    when(() => client.get(any()))
        .thenAnswer((_) async => http.Response(charactersMock, 200));
  }

  test('should call the get method with correct url', () async {
    // Arrange
    successMock();
    // Act
    await dataSource.getCharacters();
    // Assert
    verify(() => client.get(Uri.https('rickandmortyapi.com', '/api/character')))
        .called(1);
  });

  test('should retrun a CharactersModel when the call is successful', () async {
    successMock();

    final result = await dataSource.getCharacters();

    expect(result, tCharactersModel);
  });

  test('should a throw a ServerException when the call is unccessful', () {
    when(() => client.get(any()))
        .thenAnswer((_) async => http.Response('Something went wrong', 400));

    final result = dataSource.getCharacters();

    expect(() => result, throwsA(ServerException()));
  });
}
