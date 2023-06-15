import 'package:campus_flutter/placesComponent/model/studyRooms/studyRoomAttribute.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'studyRoom.g.dart';

@JsonSerializable()
class StudyRoom {
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
  final String? raum_nr_architekt;
  final int res_nr;
  final String? status;
  @JsonKey(name: "attribute")
  final List<StudyRoomAttribute>? attributes;

  String get localizedStatus {
    switch (status) {
      case "frei":
        return "Free";
      case "belegt":
        if (occupiedUntil != null) {
          return "Occupied until ${ DateFormat.yMd().format(occupiedUntil!)}";
        } else {
          return "";
        }
      default:
        return "Unkown";
    }
  }

  bool get isAvailable {
    return status == "frei";
  }


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
      this.raum_nr_architekt,
      required this.res_nr,
      this.status,
      this.attributes
  });

  factory StudyRoom.fromJson(Map<String, dynamic> json) => _$StudyRoomFromJson(json);

  Map<String, dynamic> toJson() => _$StudyRoomToJson(this);
}