// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudyRoom _$StudyRoomFromJson(Map<String, dynamic> json) => StudyRoom(
      buildingCode: json['gebaeude_code'] as String?,
      buildingName: json['gebaeude_name'] as String?,
      buildingNumber: (json['gebaeude_nr'] as num).toInt(),
      code: json['raum_code'] as String?,
      id: (json['raum_nr'] as num).toInt(),
      name: json['raum_name'] as String?,
      number: json['raum_nummer'] as String?,
      occupiedBy: json['belegung_durch'] as String?,
      occupiedFor: (json['belegung_fuer'] as num?)?.toInt(),
      occupiedFrom: DateTime.tryParse(json['belegung_ab'] as String),
      occupiedIn: (json['belegung_in'] as num?)?.toInt(),
      occupiedUntil: DateTime.tryParse(json['belegung_bis'] as String),
      roomNoArchitect: json['raum_nr_architekt'] as String?,
      resNo: (json['res_nr'] as num).toInt(),
      status: json['status'] as String?,
      attributes: (json['attribute'] as List<dynamic>?)
          ?.map((e) => StudyRoomAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudyRoomToJson(StudyRoom instance) => <String, dynamic>{
      'gebaeude_code': instance.buildingCode,
      'gebaeude_name': instance.buildingName,
      'gebaeude_nr': instance.buildingNumber,
      'raum_code': instance.code,
      'raum_nr': instance.id,
      'raum_name': instance.name,
      'raum_nummer': instance.number,
      'belegung_durch': instance.occupiedBy,
      'belegung_fuer': instance.occupiedFor,
      'belegung_ab': instance.occupiedFrom?.toIso8601String(),
      'belegung_in': instance.occupiedIn,
      'belegung_bis': instance.occupiedUntil?.toIso8601String(),
      'raum_nr_architekt': instance.roomNoArchitect,
      'res_nr': instance.resNo,
      'status': instance.status,
      'attribute': instance.attributes,
    };
