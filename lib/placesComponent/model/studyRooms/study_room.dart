import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_attribute.dart';
import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'study_room.g.dart';

@JsonSerializable()
class StudyRoom extends Searchable {
  @JsonKey(name: "gebaeude_code")
  final String? buildingCode;
  @JsonKey(name: "gebaeude_name")
  final String? buildingName;
  @JsonKey(name: "gebaeude_nr")
  final int buildingNumber;
  @JsonKey(name: "raum_code")
  final String? code;
  @JsonKey(name: "raum_nr")
  final int id;
  @JsonKey(name: "raum_name")
  final String? name;
  @JsonKey(name: "raum_nummer")
  final String? number;
  @JsonKey(name: "belegung_durch")
  final String? occupiedBy;
  @JsonKey(name: "belegung_fuer")
  final int occupiedFor;
  @JsonKey(name: "belegung_ab", fromJson: DateTime.tryParse)
  final DateTime? occupiedFrom;
  @JsonKey(name: "belegung_in")
  final int occupiedIn;
  @JsonKey(name: "belegung_bis", fromJson: DateTime.tryParse)
  final DateTime? occupiedUntil;
  @JsonKey(name: "raum_nr_architekt")
  final String? roomNoArchitect;
  @JsonKey(name: "res_nr")
  final int resNo;
  final String? status;
  @JsonKey(name: "attribute")
  final List<StudyRoomAttribute>? attributes;

  String localizedStatus(BuildContext context) {
    switch (status) {
      case "frei":
        return context.localizations.free;
      case "belegt":
        if (occupiedUntil != null) {
          return context.localizations.occupiedUntil(occupiedUntil!);
        } else {
          return context.localizations.unknown;
        }
      default:
        return context.localizations.unknown;
    }
  }

  bool get isAvailable {
    return status == "frei";
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ComparisonToken> get comparisonTokens => [
        ComparisonToken(value: name ?? ""),
        ComparisonToken(
          value: buildingCode ?? "",
          type: ComparisonTokenType.raw,
        ),
        ComparisonToken(value: buildingName ?? ""),
        ComparisonToken(
          value: buildingNumber.toString(),
          type: ComparisonTokenType.raw,
        ),
        ComparisonToken(value: status ?? ""),
        ComparisonToken(value: occupiedBy ?? ""),
        ...?attributes?.expand((element) => element.comparisonTokens),
      ];

  StudyRoom({
    this.buildingCode,
    this.buildingName,
    required this.buildingNumber,
    this.code,
    required this.id,
    this.name,
    this.number,
    this.occupiedBy,
    required this.occupiedFor,
    this.occupiedFrom,
    required this.occupiedIn,
    this.occupiedUntil,
    this.roomNoArchitect,
    required this.resNo,
    this.status,
    this.attributes,
  });

  factory StudyRoom.fromJson(Map<String, dynamic> json) =>
      _$StudyRoomFromJson(json);

  Map<String, dynamic> toJson() => _$StudyRoomToJson(this);
}
