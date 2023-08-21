import 'package:rick_and_morty/features/domain/entities/character_location.dart';

class CharacterLocationModel extends CharacterLocation {
  CharacterLocationModel({required String name, required String url})
      : super(
          name: name,
          url: url,
        );
  factory CharacterLocationModel.fromJson(Map<String, dynamic> json) =>
      CharacterLocationModel(
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}
