import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'departure.g.dart';

@JsonSerializable()
class Departure {
  @JsonKey(name: "stopID", fromJson: StringParser.stringToInt)
  final int stopId;
  @JsonKey(fromJson: StringParser.stringToInt)
  final int countdown;
  @JsonKey(fromJson: plannedDate)
  final DateTime dateTime;
  @JsonKey(fromJson: realDate)
  final DateTime? realDateTime;
  final ServingLine servingLine;
  final LineInfosType? lineInfos;

  Departure(
      {required this.stopId,
      required this.countdown,
      required this.dateTime,
      this.realDateTime,
      required this.servingLine,
      this.lineInfos});

  factory Departure.fromJson(Map<String, dynamic> json) =>
      _$DepartureFromJson(json);

  Map<String, dynamic> toJson() => _$DepartureToJson(this);

  static DateTime plannedDate(Map<String, dynamic> json) {
    return DateTime(
        int.parse(json["year"]),
        int.parse(json["month"]),
        int.parse(json["day"]),
        int.parse(json["hour"]),
        int.parse(json["minute"]));
  }

  static DateTime? realDate(Map<String, dynamic>? json) {
    if (json != null) {
      return DateTime(
          int.parse(json["year"]),
          int.parse(json["month"]),
          int.parse(json["day"]),
          int.parse(json["hour"]),
          int.parse(json["minute"]));
    } else {
      return null;
    }
  }
}

@JsonSerializable()
class DepartureDateTime {
  @JsonKey(fromJson: StringParser.stringToInt)
  final int year, month, day, weekday, hour, minute;

  DepartureDateTime(
      this.year, this.month, this.day, this.weekday, this.hour, this.minute);

  factory DepartureDateTime.fromJson(Map<String, dynamic> json) =>
      _$DepartureDateTimeFromJson(json);

  Map<String, dynamic> toJson() => _$DepartureDateTimeToJson(this);
}

@JsonSerializable()
class ServingLine {
  @JsonKey(fromJson: StringParser.stringToInt)
  final int key, code;
  final String number, symbol, direction, name;
  @JsonKey(fromJson: StringParser.optStringToOptInt)
  final int? delay;

  ServingLine(
      {required this.key,
      required this.code,
      required this.number,
      required this.symbol,
      required this.direction,
      required this.name,
      this.delay});

  factory ServingLine.fromJson(Map<String, dynamic> json) =>
      _$ServingLineFromJson(json);

  Map<String, dynamic> toJson() => _$ServingLineToJson(this);

  Color get color {
    switch (code) {
      case 3:
        return const Color.fromRGBO(1, 83, 102, 1.0);
      case 1:
        switch (number) {
          case "U2":
          case "U8":
            return const Color.fromRGBO(194, 08, 49, 1.0);
          case "U4":
            return const Color.fromRGBO(3, 169, 132, 1.0);
          case "U5":
            return const Color.fromRGBO(188, 122, 0, 1.0);
          case "U6":
            return const Color.fromRGBO(0, 114, 179, 1.0);
          default:
            return Colors.grey;
        }
      case 4:
        return const Color.fromRGBO(226, 7, 18, 1.0);
      default:
        return Colors.grey;
    }
  }
}

/// no @JsonSerializable
class LineInfosType {
  final List<LineInfoContent>? array;
  final LineInfoElement? element;

  LineInfosType({this.array, this.element});

  factory LineInfosType.fromJson(Map<String, dynamic> json) {
    if (json['lineInfos'] != null) {
      return LineInfosType(
          array: (json['lineInfos'] as List)
              .map((e) => LineInfoContent.fromJson(e))
              .toList());
    } else if (json['lineInfo'] != null) {
      return LineInfosType(element: LineInfoElement.fromJson(json));
    } else {
      throw const FormatException('Invalid LineInfosType JSON');
    }
  }

  Map<String, dynamic> toJson() => {
        'array': array?.map((e) => e.toJson()).toList(),
        'element': element?.toJson(),
      };
}

@JsonSerializable()
class LineInfoElement {
  final LineInfoContent lineInfo;

  LineInfoElement({required this.lineInfo});

  factory LineInfoElement.fromJson(Map<String, dynamic> json) =>
      _$LineInfoElementFromJson(json);

  Map<String, dynamic> toJson() => _$LineInfoElementToJson(this);
}

@JsonSerializable()
class LineInfoContent {
  final String? infoLinkText;
  final InfoText? infoText;
  final List<AdditionalLink>? additionalLinks;

  LineInfoContent({this.infoLinkText, this.infoText, this.additionalLinks});

  factory LineInfoContent.fromJson(Map<String, dynamic> json) =>
      _$LineInfoContentFromJson(json);

  Map<String, dynamic> toJson() => _$LineInfoContentToJson(this);
}

@JsonSerializable()
class AdditionalLink {
  @JsonKey(name: "ID")
  final String id;
  final String linkURL, linkText, linkTextShort, linkTarget;

  AdditionalLink(
      {required this.id,
      required this.linkURL,
      required this.linkText,
      required this.linkTextShort,
      required this.linkTarget});

  factory AdditionalLink.fromJson(Map<String, dynamic> json) =>
      _$AdditionalLinkFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalLinkToJson(this);
}

@JsonSerializable()
class InfoText {
  final String content, subtitle;

  InfoText({required this.content, required this.subtitle});

  factory InfoText.fromJson(Map<String, dynamic> json) =>
      _$InfoTextFromJson(json);

  Map<String, dynamic> toJson() => _$InfoTextToJson(this);
}
