// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['movieId'] as String,
      date: DateTime.parse(json['date'] as String),
      created: DateTime.parse(json['created'] as String),
      title: json['title'] as String,
      releaseYear: json['releaseYear'] as String,
      runTime: json['runTime'] as String?,
      genre: json['genre'] as String,
      director: json['director'] as String,
      actors: json['actors'] as String,
      imdbRating: StringParser.stringToDouble(json['imdbRating'] as String?),
      description: json['description'] as String,
      link: Uri.parse(json['link'] as String),
      coverUrl: Uri.parse(json['coverUrl'] as String),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'movieId': instance.id,
      'date': instance.date.toIso8601String(),
      'created': instance.created.toIso8601String(),
      'title': instance.title,
      'releaseYear': instance.releaseYear,
      'runTime': instance.runTime,
      'genre': instance.genre,
      'director': instance.director,
      'actors': instance.actors,
      'imdbRating': instance.imdbRating,
      'description': instance.description,
      'link': instance.link.toString(),
      'coverUrl': instance.coverUrl.toString(),
    };

MoviesData _$MoviesDataFromJson(Map<String, dynamic> json) => MoviesData(
      movies: (json['movies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesDataToJson(MoviesData instance) =>
    <String, dynamic>{
      'movies': instance.movies,
    };
