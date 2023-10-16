// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpeningHours _$OpeningHoursFromJson(Map<String, dynamic> json) => OpeningHours(
      mon: json['mon'] == null
          ? null
          : OpeningHour.fromJson(json['mon'] as Map<String, dynamic>),
      tue: json['tue'] == null
          ? null
          : OpeningHour.fromJson(json['tue'] as Map<String, dynamic>),
      wed: json['wed'] == null
          ? null
          : OpeningHour.fromJson(json['wed'] as Map<String, dynamic>),
      thu: json['thu'] == null
          ? null
          : OpeningHour.fromJson(json['thu'] as Map<String, dynamic>),
      fri: json['fri'] == null
          ? null
          : OpeningHour.fromJson(json['fri'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpeningHoursToJson(OpeningHours instance) =>
    <String, dynamic>{
      'mon': instance.mon,
      'tue': instance.tue,
      'wed': instance.wed,
      'thu': instance.thu,
      'fri': instance.fri,
    };

OpeningHour _$OpeningHourFromJson(Map<String, dynamic> json) => OpeningHour(
      start: json['start'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$OpeningHourToJson(OpeningHour instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
