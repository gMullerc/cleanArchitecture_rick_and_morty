import 'package:rick_and_morty/features/domain/entities/character_origin.dart';

class CharacterOriginModel extends CharacterOrigin {
  CharacterOriginModel({required String name, required String url})
      : super(name: name, url: url);

  factory CharacterOriginModel.fromJson(Map<String, dynamic> json) =>
      CharacterOriginModel(
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}
