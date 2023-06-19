import 'package:campus_flutter/base/helpers/stringToInt.dart';
import 'package:campus_flutter/newsComponent/model/news.dart';
import 'package:json_annotation/json_annotation.dart';

part 'newsSource.g.dart';

@JsonSerializable()
class NewsSource {
  @JsonKey(name: "source", fromJson: stringToInt)
  final int id;
  final String? title;
  final Uri? icon;
  final List<News> news = [];

  NewsSource({
    required this.id,
    this.title,
    this.icon
  });

  factory NewsSource.fromJson(Map<String, dynamic> json) => _$NewsSourceFromJson(json);

  Map<String, dynamic> toJson() => _$NewsSourceToJson(this);
}

@JsonSerializable()
class NewsSources {
  @JsonKey(name: "data")
  final List<NewsSource> newsSources;

  NewsSources({required this.newsSources});

  factory NewsSources.fromJson(Map<String, dynamic> json) => _$NewsSourcesFromJson(json);

  Map<String, dynamic> toJson() => _$NewsSourcesToJson(this);
}