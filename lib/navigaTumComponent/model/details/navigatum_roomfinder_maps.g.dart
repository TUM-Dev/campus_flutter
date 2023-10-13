// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigatum_roomfinder_maps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigaTumRoomFinderMaps _$NavigaTumRoomFinderMapsFromJson(
        Map<String, dynamic> json) =>
    NavigaTumRoomFinderMaps(
      (json['available'] as List<dynamic>)
          .map(
              (e) => NavigaTumRoomFinderMap.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['default'] as String,
    );

Map<String, dynamic> _$NavigaTumRoomFinderMapsToJson(
        NavigaTumRoomFinderMaps instance) =>
    <String, dynamic>{
      'available': instance.available,
      'default': instance.defaultMapId,
    };
