// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigatum_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigaTumSearchResponse _$NavigaTumSearchResponseFromJson(
  Map<String, dynamic> json,
) => NavigaTumSearchResponse(
  (json['sections'] as List<dynamic>)
      .map(
        (e) =>
            NavigaTumSearchResponseSection.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$NavigaTumSearchResponseToJson(
  NavigaTumSearchResponse instance,
) => <String, dynamic>{'sections': instance.sections};
