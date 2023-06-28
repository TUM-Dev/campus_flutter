// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsSource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsSource _$NewsSourceFromJson(Map<String, dynamic> json) => NewsSource(
      id: StringParser.stringToInt(json['source'] as String?),
      title: json['title'] as String?,
      icon: json['icon'] == null ? null : Uri.parse(json['icon'] as String),
    );

Map<String, dynamic> _$NewsSourceToJson(NewsSource instance) =>
    <String, dynamic>{
      'source': instance.id,
      'title': instance.title,
      'icon': instance.icon?.toString(),
    };

NewsSources _$NewsSourcesFromJson(Map<String, dynamic> json) => NewsSources(
      newsSources: (json['data'] as List<dynamic>)
          .map((e) => NewsSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsSourcesToJson(NewsSources instance) =>
    <String, dynamic>{
      'data': instance.newsSources,
    };
