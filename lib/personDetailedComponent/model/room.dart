import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
  @JsonKey(name: "nummer")
  final String number;
  @JsonKey(name: "gebaeudename")
  final String buildingName;
  @JsonKey(name: "gebaeudenummer")
  final String buildingNumber;
  @JsonKey(name: "stockwerkname")
  final String floorName;
  @JsonKey(name: "stockwerknummer")
  final String floorNumber;
  @JsonKey(name: "architekt")
  final String id;
  @JsonKey(name: "ortsbeschreibung")
  final String locationDescription;
  @JsonKey(name: "kurz")
  final String shortLocationDescription;
  @JsonKey(name: "lang")
  final String longLocationDescription;

  Room({
    required this.number,
    required this.buildingName,
    required this.buildingNumber,
    required this.floorName,
    required this.floorNumber,
    required this.id,
    required this.locationDescription,
    required this.shortLocationDescription,
    required this.longLocationDescription
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}