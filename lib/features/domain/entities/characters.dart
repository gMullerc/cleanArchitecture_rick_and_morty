import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/domain/entities/character.dart';
import 'package:rick_and_morty/features/domain/entities/info.dart';

class CharactersEntity extends Equatable {
  CharactersEntity.noAttributes();
  CharactersEntity({
    required this.info,
    required this.character,
  });
  late final Info info;
  late final List<Character> character;

  @override
  List<Object?> get props => [
        info,
        character,
      ];
}
