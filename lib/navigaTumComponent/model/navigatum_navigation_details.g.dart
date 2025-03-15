// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigatum_navigation_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigaTumNavigationDetails _$NavigaTumNavigationDetailsFromJson(
  Map<String, dynamic> json,
) => NavigaTumNavigationDetails(
  json['id'] as String,
  json['name'] as String,
  (json['parent_names'] as List<dynamic>).map((e) => e as String).toList(),
  json['type'] as String,
  json['type_common_name'] as String,
  NavigaTumNavigationAdditionalProperties.fromJson(
    json['props'] as Map<String, dynamic>,
  ),
  NavigaTumNavigationCoordinates.fromJson(
    json['coords'] as Map<String, dynamic>,
  ),
  NavigaTumNavigationMaps.fromJson(json['maps'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NavigaTumNavigationDetailsToJson(
  NavigaTumNavigationDetails instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'parent_names': instance.parentNames,
  'type': instance.type,
  'type_common_name': instance.typeCommonName,
  'props': instance.additionalProperties,
  'coords': instance.coordinates,
  'maps': instance.maps,
};
