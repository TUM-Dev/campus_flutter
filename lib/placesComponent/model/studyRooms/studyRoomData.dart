import 'package:campus_flutter/placesComponent/model/studyRooms/studyRoom.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/studyRoomGroup.dart';
import 'package:json_annotation/json_annotation.dart';

part 'studyRoomData.g.dart';

@JsonSerializable()
class StudyRoomData {
  @JsonKey(name: "raeume")
  final List<StudyRoom>? rooms;
  @JsonKey(name: "gruppen")
  final List<StudyRoomGroup>? groups;

  StudyRoomData({
    this.rooms,
    this.groups
  });

  factory StudyRoomData.fromJson(Map<String, dynamic> json) => _$StudyRoomDataFromJson(json);

  Map<String, dynamic> toJson() => _$StudyRoomDataToJson(this);
}