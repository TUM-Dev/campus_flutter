// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Departure _$DepartureFromJson(Map<String, dynamic> json) => Departure(
      stopId: stringToInt(json['stopID'] as String?),
      countdown: stringToInt(json['countdown'] as String?),
      dateTime:
          DepartureDateTime.fromJson(json['dateTime'] as Map<String, dynamic>),
      realDateTime: json['realDateTime'] == null
          ? null
          : DepartureDateTime.fromJson(
              json['realDateTime'] as Map<String, dynamic>),
      servingLine:
          ServingLine.fromJson(json['servingLine'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartureToJson(Departure instance) => <String, dynamic>{
      'stopID': instance.stopId,
      'countdown': instance.countdown,
      'dateTime': instance.dateTime,
      'realDateTime': instance.realDateTime,
      'servingLine': instance.servingLine,
    };

DepartureDateTime _$DepartureDateTimeFromJson(Map<String, dynamic> json) =>
    DepartureDateTime(
      stringToInt(json['year'] as String?),
      stringToInt(json['month'] as String?),
      stringToInt(json['day'] as String?),
      stringToInt(json['weekday'] as String?),
      stringToInt(json['hour'] as String?),
      stringToInt(json['minute'] as String?),
    );

Map<String, dynamic> _$DepartureDateTimeToJson(DepartureDateTime instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'weekday': instance.weekday,
      'hour': instance.hour,
      'minute': instance.minute,
    };

ServingLine _$ServingLineFromJson(Map<String, dynamic> json) => ServingLine(
      key: stringToInt(json['key'] as String?),
      code: stringToInt(json['code'] as String?),
      number: json['number'] as String,
      symbol: json['symbol'] as String,
      direction: json['direction'] as String,
      name: json['name'] as String,
      delay: optStringToOptInt(json['delay'] as String?),
    );

Map<String, dynamic> _$ServingLineToJson(ServingLine instance) =>
    <String, dynamic>{
      'key': instance.key,
      'code': instance.code,
      'number': instance.number,
      'symbol': instance.symbol,
      'direction': instance.direction,
      'name': instance.name,
      'delay': instance.delay,
    };
