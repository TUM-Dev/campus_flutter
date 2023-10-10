// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigatum_navigation_additional_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigaTumNavigationAdditionalProperties
    _$NavigaTumNavigationAdditionalPropertiesFromJson(
            Map<String, dynamic> json) =>
        NavigaTumNavigationAdditionalProperties(
          (json['computed'] as List<dynamic>)
              .map((e) => NavigaTumNavigationProperty.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$NavigaTumNavigationAdditionalPropertiesToJson(
        NavigaTumNavigationAdditionalProperties instance) =>
    <String, dynamic>{
      'computed': instance.properties,
    };
