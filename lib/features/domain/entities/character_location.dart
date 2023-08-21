import 'package:equatable/equatable.dart';

class CharacterLocation extends Equatable {
  CharacterLocation({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;
  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
