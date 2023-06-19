// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      id: json['news'] as String,
      source: json['src'] as String,
      date: DateTime.parse(json['date'] as String),
      created: DateTime.parse(json['created'] as String),
      title: json['title'] as String,
      link: Uri.parse(json['link'] as String),
      image: Uri.parse(json['image'] as String),
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'news': instance.id,
      'src': instance.source,
      'date': instance.date.toIso8601String(),
      'created': instance.created.toIso8601String(),
      'title': instance.title,
      'link': instance.link.toString(),
      'image': instance.image.toString(),
    };

NewsData _$NewsDataFromJson(Map<String, dynamic> json) => NewsData(
      news: (json['data'] as List<dynamic>)
          .map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsDataToJson(NewsData instance) => <String, dynamic>{
      'data': instance.news,
    };
