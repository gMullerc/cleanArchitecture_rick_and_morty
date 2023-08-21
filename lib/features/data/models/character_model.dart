import 'package:rick_and_morty/features/data/models/character_location_model.dart';
import 'package:rick_and_morty/features/data/models/character_origin_model.dart';
import 'package:rick_and_morty/features/domain/entities/character.dart';
import 'package:rick_and_morty/features/domain/entities/character_location.dart';
import 'package:rick_and_morty/features/domain/entities/character_origin.dart';

class CharacterModel extends Character {
  CharacterModel(
      {required int id,
      required String name,
      required String status,
      required String species,
      required String type,
      required String gender,
      required CharacterOrigin origin,
      required CharacterLocation location,
      required String image,
      required List<String> episode,
      required String url,
      required String created})
      : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          origin: origin,
          location: location,
          image: image,
          episode: episode,
          url: url,
          created: created,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: CharacterOriginModel.fromJson(json['origin']),
      location: CharacterLocationModel.fromJson(json['location']),
      image: json['image'],
      episode: List.castFrom<dynamic, String>(json['episode']),
      url: json['url'],
      created: json['created'],
    );
  }
}
