// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['kino'] as String,
      date: DateTime.parse(json['date'] as String),
      created: DateTime.parse(json['created'] as String),
      title: json['title'] as String,
      year: json['year'] as String,
      runTime: json['runTime'] as String?,
      genre: json['genre'] as String,
      director: json['director'] as String,
      actors: json['actors'] as String,
      rating: StringParser.stringToDouble(json['rating'] as String?),
      description: json['description'] as String,
      cover: Uri.parse(json['cover'] as String),
      trailer:
          json['trailer'] == null ? null : Uri.parse(json['trailer'] as String),
      link: Uri.parse(json['link'] as String),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'kino': instance.id,
      'date': instance.date.toIso8601String(),
      'created': instance.created.toIso8601String(),
      'title': instance.title,
      'year': instance.year,
      'runTime': instance.runTime,
      'genre': instance.genre,
      'director': instance.director,
      'actors': instance.actors,
      'rating': instance.rating,
      'description': instance.description,
      'cover': instance.cover.toString(),
      'trailer': instance.trailer?.toString(),
      'link': instance.link.toString(),
    };

MoviesData _$MoviesDataFromJson(Map<String, dynamic> json) => MoviesData(
      movies: (json['data'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesDataToJson(MoviesData instance) =>
    <String, dynamic>{
      'data': instance.movies,
    };
