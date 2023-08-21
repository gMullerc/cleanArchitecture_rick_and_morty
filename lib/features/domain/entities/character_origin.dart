import 'package:equatable/equatable.dart';

class CharacterOrigin extends Equatable {
  CharacterOrigin({
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
