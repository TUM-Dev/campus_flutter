import 'package:json_annotation/json_annotation.dart';

part 'study_room_image_mapping.g.dart';

@JsonSerializable()
class StudyRoomImageMapping {
  @JsonKey(name: "map_id")
  final int id;
  final String description;
  final int scale;
  final int width;
  final int heigth;


  StudyRoomImageMapping({
    required this.id,
    required this.description,
    required this.scale,
    required this.width,
    required this.heigth
  });

  factory StudyRoomImageMapping.fromJson(Map<String, dynamic> json) => _$StudyRoomImageMappingFromJson(json);

  Map<String, dynamic> toJson() => _$StudyRoomImageMappingToJson(this);
}