import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
  @JsonKey(name: "nummer")
  final String? number;
  @JsonKey(name: "gebaeudename")
  final String? buildingName;
  @JsonKey(name: "gebaeudenummer")
  final String? buildingNumber;
  @JsonKey(name: "stockwerkname")
  final String? floorName;
  @JsonKey(name: "stockwerknummer")
  final String? floorNumber;
  @JsonKey(name: "architekt")
  final String? id;
  @JsonKey(name: "ortsbeschreibung")
  final String? locationDescription;
  @JsonKey(name: "kurz")
  final String? shortLocationDescription;
  @JsonKey(name: "lang")
  final String? longLocationDescription;

  Room(
      {this.number,
      this.buildingName,
      this.buildingNumber,
      this.floorName,
      this.floorNumber,
      this.id,
      this.locationDescription,
      this.shortLocationDescription,
      this.longLocationDescription});

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
