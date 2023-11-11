// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigatum_navigation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigaTumNavigationEntity _$NavigaTumNavigationEntityFromJson(
  Map<String, dynamic> json,
) =>
    NavigaTumNavigationEntity(
      id: json['id'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      subtext: json['subtext'] as String,
      parsedId: json['parsed_id'] as String?,
    );

Map<String, dynamic> _$NavigaTumNavigationEntityToJson(
  NavigaTumNavigationEntity instance,
) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'subtext': instance.subtext,
      'parsed_id': instance.parsedId,
    };
