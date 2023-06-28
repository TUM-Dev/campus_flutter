// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Departure _$DepartureFromJson(Map<String, dynamic> json) => Departure(
      stopId: StringParser.stringToInt(json['stopID'] as String?),
      countdown: StringParser.stringToInt(json['countdown'] as String?),
      dateTime: Departure.plannedDate(json['dateTime'] as Map<String, dynamic>),
      realDateTime:
          Departure.realDate(json['realDateTime'] as Map<String, dynamic>?),
      servingLine:
          ServingLine.fromJson(json['servingLine'] as Map<String, dynamic>),
      lineInfos: json['lineInfos'] == null
          ? null
          : LineInfosType.fromJson(json['lineInfos'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartureToJson(Departure instance) => <String, dynamic>{
      'stopID': instance.stopId,
      'countdown': instance.countdown,
      'dateTime': instance.dateTime.toIso8601String(),
      'realDateTime': instance.realDateTime?.toIso8601String(),
      'servingLine': instance.servingLine,
      'lineInfos': instance.lineInfos,
    };

DepartureDateTime _$DepartureDateTimeFromJson(Map<String, dynamic> json) =>
    DepartureDateTime(
      StringParser.stringToInt(json['year'] as String?),
      StringParser.stringToInt(json['month'] as String?),
      StringParser.stringToInt(json['day'] as String?),
      StringParser.stringToInt(json['weekday'] as String?),
      StringParser.stringToInt(json['hour'] as String?),
      StringParser.stringToInt(json['minute'] as String?),
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
      key: StringParser.stringToInt(json['key'] as String?),
      code: StringParser.stringToInt(json['code'] as String?),
      number: json['number'] as String,
      symbol: json['symbol'] as String,
      direction: json['direction'] as String,
      name: json['name'] as String,
      delay: StringParser.optStringToOptInt(json['delay'] as String?),
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

LineInfoElement _$LineInfoElementFromJson(Map<String, dynamic> json) =>
    LineInfoElement(
      lineInfo:
          LineInfoContent.fromJson(json['lineInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LineInfoElementToJson(LineInfoElement instance) =>
    <String, dynamic>{
      'lineInfo': instance.lineInfo,
    };

LineInfoContent _$LineInfoContentFromJson(Map<String, dynamic> json) =>
    LineInfoContent(
      infoLinkText: json['infoLinkText'] as String?,
      infoText: json['infoText'] == null
          ? null
          : InfoText.fromJson(json['infoText'] as Map<String, dynamic>),
      additionalLinks: (json['additionalLinks'] as List<dynamic>?)
          ?.map((e) => AdditionalLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LineInfoContentToJson(LineInfoContent instance) =>
    <String, dynamic>{
      'infoLinkText': instance.infoLinkText,
      'infoText': instance.infoText,
      'additionalLinks': instance.additionalLinks,
    };

AdditionalLink _$AdditionalLinkFromJson(Map<String, dynamic> json) =>
    AdditionalLink(
      id: json['ID'] as String,
      linkURL: json['linkURL'] as String,
      linkText: json['linkText'] as String,
      linkTextShort: json['linkTextShort'] as String,
      linkTarget: json['linkTarget'] as String,
    );

Map<String, dynamic> _$AdditionalLinkToJson(AdditionalLink instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'linkURL': instance.linkURL,
      'linkText': instance.linkText,
      'linkTextShort': instance.linkTextShort,
      'linkTarget': instance.linkTarget,
    };

InfoText _$InfoTextFromJson(Map<String, dynamic> json) => InfoText(
      content: json['content'] as String,
      subtitle: json['subtitle'] as String,
    );

Map<String, dynamic> _$InfoTextToJson(InfoText instance) => <String, dynamic>{
      'content': instance.content,
      'subtitle': instance.subtitle,
    };
