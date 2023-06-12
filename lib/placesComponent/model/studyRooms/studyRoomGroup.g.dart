// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studyRoomGroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudyRoomGroup _$StudyRoomGroupFromJson(Map<String, dynamic> json) =>
    StudyRoomGroup(
      detail: json['detail'] as String?,
      id: json['nr'] as int,
      name: json['name'] as String?,
      sorting: json['sortierung'] as int,
      rooms: (json['raeume'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$StudyRoomGroupToJson(StudyRoomGroup instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'nr': instance.id,
      'name': instance.name,
      'sortierung': instance.sorting,
      'raeume': instance.rooms,
    };
