// import 'package:either_dart/either.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:rick_and_morty/core/usecase/usecase.dart';
// import 'package:rick_and_morty/features/data/models/character_location_model.dart';
// import 'package:rick_and_morty/features/data/models/character_model.dart';
// import 'package:rick_and_morty/features/data/models/character_origin_model.dart';
// import 'package:rick_and_morty/features/data/models/characters_model.dart';
// import 'package:rick_and_morty/features/data/models/info_model.dart';
// import 'package:rick_and_morty/features/domain/usecases/get_characters_list.dart';
// import 'package:rick_and_morty/features/presenter/bloc/rick_and_morty_bloc.dart';
// import 'package:rick_and_morty/features/presenter/bloc/rick_and_morty_event.dart';
// import 'package:rick_and_morty/features/presenter/bloc/rick_and_morty_state.dart';

// import '../../mocks/characters_list_entity_mock.dart';

// class MockRickAndMortyUseCase extends Mock implements GetCharactersList {}

// void main() {
//   group('Rick and morty Bloc Test', () {
//     late RickAndMortyBloc rickAndMortyBloc;
//     late MockRickAndMortyUseCase mockRickAndMortyUseCase;
//     late RickAndMortyStateInitial rickAndMortyStateInitial;

//     setUp(() {
//       mockRickAndMortyUseCase = MockRickAndMortyUseCase();
//       rickAndMortyStateInitial = RickAndMortyStateInitial();
//       rickAndMortyBloc =
//           RickAndMortyBloc(rickAndMortyStateInitial, mockRickAndMortyUseCase);
//     });

//     test('should return a LoadedStatate when FetchCharactersEvent is called',
//         () {
//       when(
//         () => mockRickAndMortyUseCase.call(NoParams()),
//       ).thenAnswer((invocation) async => Right(tCharacters));
//       rickAndMortyBloc.add(FetchRickAndMortyCharacterEvent());

//       expectLater(
//         rickAndMortyBloc,
//         emitsInOrder([
//           RickAndMortyStateLoading(),
//           RickAndMortyStateLoaded(tCharacters),
//         ]),
//       );

//       tearDown(() => rickAndMortyBloc.close());
//     });
//   });
// }
