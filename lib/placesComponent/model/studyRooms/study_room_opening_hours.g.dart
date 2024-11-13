// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_room_opening_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudyRoomOpeningHours _$StudyRoomOpeningHoursFromJson(
        Map<String, dynamic> json) =>
    StudyRoomOpeningHours(
      daysString: json['days'] as String,
      daysBitMask: json['daysbitmask'] as String,
      start: json['start'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$StudyRoomOpeningHoursToJson(
        StudyRoomOpeningHours instance) =>
    <String, dynamic>{
      'days': instance.daysString,
      'daysbitmask': instance.daysBitMask,
      'start': instance.start,
      'end': instance.end,
    };
