import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie extends Searchable {
  @JsonKey(name: "movieId")
  final String id;
  final DateTime date;
  final DateTime created;
  final String title;
  final String releaseYear;
  final String? runTime;
  final String genre;
  final String director;
  final String actors;
  @JsonKey(fromJson: StringParser.stringToDouble)
  final double? imdbRating;
  final String description;
  final String coverName;
  final String coverId;
  final Uri link;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ComparisonToken> get comparisonTokens =>
      [ComparisonToken(value: title), ComparisonToken(value: genre)];

  Movie(
      {required this.id,
      required this.date,
      required this.created,
      required String title,
      required this.releaseYear,
      this.runTime,
      required this.genre,
      required this.director,
      required this.actors,
      this.imdbRating,
      required this.description,
      required this.coverId,
      required this.coverName,
      required this.link})
      : title = title.split(":")[1].trim();

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class MoviesData {
  List<Movie> movies;

  MoviesData({required this.movies});

  factory MoviesData.fromJson(Map<String, dynamic> json) =>
      _$MoviesDataFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesDataToJson(this);
}
