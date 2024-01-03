import 'package:json_annotation/json_annotation.dart';

part 'navigatum_roomfinder_map.g.dart';

@JsonSerializable()
class NavigaTumRoomFinderMap {
  final String id;
  final String name;
  @JsonKey(name: "file")
  final String imageUrl;
  final int height;
  final int width;
  final int x;
  final int y;
  final String scale;

  NavigaTumRoomFinderMap({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.x,
    required this.y,
    required this.scale,
  });

  factory NavigaTumRoomFinderMap.fromJson(Map<String, dynamic> json) =>
      _$NavigaTumRoomFinderMapFromJson(json);

  Map<String, dynamic> toJson() => _$NavigaTumRoomFinderMapToJson(this);
}
