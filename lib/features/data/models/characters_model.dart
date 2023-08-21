import 'package:rick_and_morty/features/data/models/character_model.dart';
import 'package:rick_and_morty/features/data/models/info_model.dart';
import 'package:rick_and_morty/features/domain/entities/character.dart';
import 'package:rick_and_morty/features/domain/entities/characters.dart';
import 'package:rick_and_morty/features/domain/entities/info.dart';

class CharactersModel extends CharactersEntity {
  CharactersModel({required Info info, required List<Character> character})
      : super(
          info: info,
          character: character,
        );

  factory CharactersModel.fromJson(Map<String, dynamic> json) =>
      CharactersModel(
          info: InfoModel.fromJson(json['info']),
          character: List.from(json['results'])
              .map((e) => CharacterModel.fromJson(e))
              .toList());

  Map<String, dynamic> toJson() {
    return {
      'info': info,
      'character': List<dynamic>.from(character.map((x) => x)),
    };
  }
}
