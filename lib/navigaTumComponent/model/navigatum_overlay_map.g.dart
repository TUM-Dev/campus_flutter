// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigatum_overlay_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigaTumOverlayMap _$NavigaTumOverlayMapFromJson(Map<String, dynamic> json) =>
    NavigaTumOverlayMap(
      json['id'] as int,
      json['floor'] as String,
      json['file'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$NavigaTumOverlayMapToJson(
        NavigaTumOverlayMap instance) =>
    <String, dynamic>{
      'id': instance.id,
      'floor': instance.floor,
      'file': instance.imageUrl,
      'name': instance.name,
    };
