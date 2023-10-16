// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigatum_overlays_maps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigaTumOverlayMaps _$NavigaTumOverlayMapsFromJson(
        Map<String, dynamic> json) =>
    NavigaTumOverlayMaps(
      (json['available'] as List<dynamic>)
          .map((e) => NavigaTumOverlayMap.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NavigaTumOverlayMapsToJson(
        NavigaTumOverlayMaps instance) =>
    <String, dynamic>{
      'available': instance.available,
    };
