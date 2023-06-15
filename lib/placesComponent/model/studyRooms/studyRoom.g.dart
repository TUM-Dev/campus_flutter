// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studyRoom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudyRoom _$StudyRoomFromJson(Map<String, dynamic> json) => StudyRoom(
      buildingCode: json['gebaeude_code'] as String?,
      buildingName: json['gebaeude_name'] as String?,
      buildingNumber: json['gebaeude_nr'] as int,
      code: json['raum_code'] as String?,
      id: json['raum_nr'] as int,
      name: json['raum_name'] as String?,
      number: json['raum_nummer'] as String?,
      occupiedBy: json['belegung_durch'] as String?,
      occupiedFor: json['belegung_fuer'] as int,
      occupiedFrom: DateTime.tryParse(json['belegung_ab'] as String),
      occupiedIn: json['belegung_in'] as int,
      occupiedUntil: DateTime.tryParse(json['belegung_bis'] as String),
      raum_nr_architekt: json['raum_nr_architekt'] as String?,
      res_nr: json['res_nr'] as int,
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
      'raum_nr_architekt': instance.raum_nr_architekt,
      'res_nr': instance.res_nr,
      'status': instance.status,
      'attribute': instance.attributes,
    };
