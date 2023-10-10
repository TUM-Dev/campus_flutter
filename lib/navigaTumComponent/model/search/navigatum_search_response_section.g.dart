// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigatum_search_response_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigaTumSearchResponseSection _$NavigaTumSearchResponseSectionFromJson(
        Map<String, dynamic> json) =>
    NavigaTumSearchResponseSection(
      json['facet'] as String,
      (json['entries'] as List<dynamic>)
          .map((e) =>
              NavigaTumNavigationEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NavigaTumSearchResponseSectionToJson(
        NavigaTumSearchResponseSection instance) =>
    <String, dynamic>{
      'facet': instance.type,
      'entries': instance.entries,
    };
