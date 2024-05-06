// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_room_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudyRoomGroup _$StudyRoomGroupFromJson(Map<String, dynamic> json) =>
    StudyRoomGroup(
      detail: json['detail'] as String?,
      id: (json['nr'] as num).toInt(),
      name: json['name'] as String,
      sorting: (json['sortierung'] as num).toInt(),
      rooms: (json['raeume'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$StudyRoomGroupToJson(StudyRoomGroup instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'nr': instance.id,
      'name': instance.name,
      'sortierung': instance.sorting,
      'raeume': instance.rooms,
    };
