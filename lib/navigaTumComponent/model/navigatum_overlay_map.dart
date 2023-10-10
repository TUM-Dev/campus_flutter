import 'package:json_annotation/json_annotation.dart';

part 'navigatum_overlay_map.g.dart';

@JsonSerializable()
class NavigaTumOverlayMap {
  final int id;
  final String floor;
  @JsonKey(name: "file")
  final String imageUrl;
  final String name;

  NavigaTumOverlayMap(this.id, this.floor, this.imageUrl, this.name);

  factory NavigaTumOverlayMap.fromJson(Map<String, dynamic> json) =>
      _$NavigaTumOverlayMapFromJson(json);

  Map<String, dynamic> toJson() => _$NavigaTumOverlayMapToJson(this);
}
