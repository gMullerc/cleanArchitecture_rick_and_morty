import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/domain/entities/character_location.dart';
import 'package:rick_and_morty/features/domain/entities/character_origin.dart';

class Character extends Equatable {
  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });
  late final int id;
  late final String name;
  late final String status;
  late final String species;
  late final String type;
  late final String gender;
  late final CharacterOrigin origin;
  late final CharacterLocation location;
  late final String image;
  late final List<String> episode;
  late final String url;
  late final String created;
  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        url,
        created,
      ];
}
