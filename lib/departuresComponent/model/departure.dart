import 'package:campus_flutter/base/helpers/stringToInt.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'departure.g.dart';

@JsonSerializable()
class Departure {
  @JsonKey(name: "stopID", fromJson: stringToInt)
  final int stopId;
  @JsonKey(fromJson: stringToInt)
  final int countdown;
  final DepartureDateTime dateTime;
  final DepartureDateTime? realDateTime;
  final ServingLine servingLine;
  //final LineInfosType? lineInfos;

  Departure({
    required this.stopId,
    required this.countdown,
    required this.dateTime,
    this.realDateTime,
    required this.servingLine,
    //this.lineInfos
  });

  factory Departure.fromJson(Map<String, dynamic> json) => _$DepartureFromJson(json);

  Map<String, dynamic> toJson() => _$DepartureToJson(this);
}

@JsonSerializable()
class DepartureDateTime {
  @JsonKey(fromJson: stringToInt)
  final int year, month, day, weekday, hour, minute;

  DepartureDateTime(this.year, this.month, this.day, this.weekday, this.hour, this.minute);

  factory DepartureDateTime.fromJson(Map<String, dynamic> json) => _$DepartureDateTimeFromJson(json);

  Map<String, dynamic> toJson() => _$DepartureDateTimeToJson(this);
}

@JsonSerializable()
class ServingLine {
  @JsonKey(fromJson: stringToInt)
  final int key, code;
  final String number, symbol, direction, name;
  @JsonKey(fromJson: optStringToOptInt)
  final int? delay;

  ServingLine({
    required this.key,
    required this.code,
    required this.number,
    required this.symbol,
    required this.direction,
    required this.name,
    this.delay
  });

  factory ServingLine.fromJson(Map<String, dynamic> json) => _$ServingLineFromJson(json);

  Map<String, dynamic> toJson() => _$ServingLineToJson(this);

  Color get color {
    switch(code) {
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

// TODO:
/*
/// found on https://stackoverflow.com/questions/48739760/swift-4-json-codable-value-returned-is-sometimes-an-object-others-an-array
enum LineInfosType: Codable, Hashable {
case array([LineInfoContent])
case element(LineInfoElement)

init(from decoder: Decoder) throws {
let container = try decoder.singleValueContainer()
do {
self = try .array(container.decode([LineInfoContent].self))
} catch DecodingError.typeMismatch {
do {
self = try .element(container.decode(LineInfoElement.self))
} catch DecodingError.typeMismatch {
throw DecodingError.typeMismatch(LineInfosType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Encoded payload not of an expected type"))
}
}
}

func encode(to encoder: Encoder) throws {
var container = encoder.singleValueContainer()
switch self {
case .array(let array):
try container.encode(array)
case .element(let element):
try container.encode(element)
}
}
}

struct LineInfoElement: Hashable, Codable {
let lineInfo: LineInfoContent
}

struct LineInfoContent: Hashable, Codable {
let infoLinkText: String?
let infoText: InfoText?
let additionalLinks: [AdditionalLink]?
}

struct AdditionalLink: Hashable, Codable {
let id: String
let linkURL: String
let linkText, linkTextShort, linkTarget: String

enum CodingKeys: String, CodingKey {
case id = "ID"
case linkURL, linkText, linkTextShort, linkTarget
}
}

struct InfoText: Hashable, Codable {
let content, subtitle: String
}*/
