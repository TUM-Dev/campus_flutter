// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studyRoomImageMapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudyRoomImageMapping _$StudyRoomImageMappingFromJson(
        Map<String, dynamic> json) =>
    StudyRoomImageMapping(
      id: json['map_id'] as int,
      description: json['description'] as String,
      scale: json['scale'] as int,
      width: json['width'] as int,
      heigth: json['heigth'] as int,
    );

Map<String, dynamic> _$StudyRoomImageMappingToJson(
        StudyRoomImageMapping instance) =>
    <String, dynamic>{
      'map_id': instance.id,
      'description': instance.description,
      'scale': instance.scale,
      'width': instance.width,
      'heigth': instance.heigth,
    };
