import 'package:json_annotation/json_annotation.dart';

part 'get_posts.g.dart';

@JsonSerializable() //аннотация пакета json, описание визуализации данных
class Posts {
  final int id;
  final String title;
  final String body;

  const Posts({
    required this.id,
    required this.title,
    required this.body,
  });
//принимает данные мап и превращает его в постс (структурирует данные)
  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
//наоборот
  Map<String, dynamic> toJson() => _$PostsToJson(this);
}