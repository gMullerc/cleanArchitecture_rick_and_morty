import 'package:rick_and_morty/features/domain/entities/info.dart';

class InfoModel extends Info {
  InfoModel(
      {required int count,
      required int pages,
      required String next,
      required Null prev})
      : super(count: count, pages: pages, next: next, prev: prev);

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev']);

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }
}
