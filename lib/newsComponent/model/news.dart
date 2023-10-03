import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends Searchable {
  @JsonKey(name: "news")
  final String id;
  @JsonKey(name: "src")
  final String source;
  final DateTime date;
  final DateTime created;
  final String title;
  final Uri link;
  final Uri image;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ComparisonToken> get comparisonTokens => [
        ComparisonToken(value: title),
      ];

  News(
      {required this.id,
      required this.source,
      required this.date,
      required this.created,
      required this.title,
      required this.link,
      required this.image});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}

@JsonSerializable()
class NewsData {
  @JsonKey(name: "data")
  List<News> news;

  NewsData({required this.news});

  factory NewsData.fromJson(Map<String, dynamic> json) =>
      _$NewsDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDataToJson(this);
}
