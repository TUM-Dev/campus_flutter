// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigatum_navigation_maps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigaTumNavigationMaps _$NavigaTumNavigationMapsFromJson(
        Map<String, dynamic> json) =>
    NavigaTumNavigationMaps(
      json['default'] as String,
      json['roomfinder'] == null
          ? null
          : NavigaTumRoomFinderMaps.fromJson(
              json['roomfinder'] as Map<String, dynamic>),
      json['overlays'] == null
          ? null
          : NavigaTumOverlayMaps.fromJson(
              json['overlays'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NavigaTumNavigationMapsToJson(
        NavigaTumNavigationMaps instance) =>
    <String, dynamic>{
      'default': instance.defaultMapId,
      'roomfinder': instance.roomfinder,
      'overlays': instance.overlays,
    };
