
import 'package:campus_flutter/base/helpers/stringToDouble.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: "kino")
  final String id;
  final DateTime date;
  final DateTime created;
  final String title;
  final String year;
  final String? runTime;
  final String genre;
  final String director;
  final String actors;
  @JsonKey(fromJson: stringToDouble)
  final double? rating;
  final String description;
  final Uri cover;
  final Uri? trailer;
  final Uri link;

  Movie({
    required this.id,
    required this.date,
    required this.created,
    required String title,
    required this.year,
    this.runTime,
    required this.genre,
    required this.director,
    required this.actors,
    this.rating,
    required this.description,
    required this.cover,
    required this.trailer,
    required this.link
  }) : title = title.split(":")[1].trim();

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class MoviesData {
  @JsonKey(name: "data")
  List<Movie> movies;

  MoviesData({required this.movies});

  factory MoviesData.fromJson(Map<String, dynamic> json) => _$MoviesDataFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesDataToJson(this);
}