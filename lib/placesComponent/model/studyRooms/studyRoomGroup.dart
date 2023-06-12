import 'package:json_annotation/json_annotation.dart';

part 'studyRoomGroup.g.dart';

@JsonSerializable()
class StudyRoomGroup {
  final String? detail;
  @JsonKey(name: "nr")
  final int id;
  final String? name;
  @JsonKey(name: "sortierung")
  final int sorting;
  @JsonKey(name: "raeume")
  final List<int>? rooms;

  StudyRoomGroup({
    this.detail,
    required this.id,
    this.name,
    required this.sorting,
    this.rooms
  });

  factory StudyRoomGroup.fromJson(Map<String, dynamic> json) => _$StudyRoomGroupFromJson(json);

  Map<String, dynamic> toJson() => _$StudyRoomGroupToJson(this);
}