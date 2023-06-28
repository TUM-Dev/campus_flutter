// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studyRoomData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudyRoomData _$StudyRoomDataFromJson(Map<String, dynamic> json) =>
    StudyRoomData(
      rooms: (json['raeume'] as List<dynamic>?)
          ?.map((e) => StudyRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
      groups: (json['gruppen'] as List<dynamic>?)
          ?.map((e) => StudyRoomGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudyRoomDataToJson(StudyRoomData instance) =>
    <String, dynamic>{
      'raeume': instance.rooms,
      'gruppen': instance.groups,
    };
