import 'package:json_annotation/json_annotation.dart';

part 'study_room_attribute.g.dart';

@JsonSerializable()
class StudyRoomAttribute {
  final String? detail;
  final String? name;

  StudyRoomAttribute({this.detail, this.name});

  factory StudyRoomAttribute.fromJson(Map<String, dynamic> json) =>
      _$StudyRoomAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$StudyRoomAttributeToJson(this);
}
