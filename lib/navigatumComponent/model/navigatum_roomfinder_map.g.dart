// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigatum_roomfinder_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigaTumRoomFinderMap _$NavigaTumRoomFinderMapFromJson(
        Map<String, dynamic> json) =>
    NavigaTumRoomFinderMap(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['file'] as String,
      height: StringParser.stringToInt(json['height'] as String?),
      width: StringParser.stringToInt(json['width'] as String?),
      x: StringParser.stringToInt(json['x'] as String?),
      y: StringParser.stringToInt(json['y'] as String?),
      scale: json['scale'] as String,
    );

Map<String, dynamic> _$NavigaTumRoomFinderMapToJson(
        NavigaTumRoomFinderMap instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'file': instance.imageUrl,
      'height': instance.height,
      'width': instance.width,
      'x': instance.x,
      'y': instance.y,
      'scale': instance.scale,
    };
