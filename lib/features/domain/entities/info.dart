import 'package:equatable/equatable.dart';

class Info extends Equatable {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    this.prev,
  });
  late final int count;
  late final int pages;
  late final String next;
  late final Null prev;

  @override
  List<Object?> get props => [
        count,
        pages,
        next,
        prev,
      ];
}
