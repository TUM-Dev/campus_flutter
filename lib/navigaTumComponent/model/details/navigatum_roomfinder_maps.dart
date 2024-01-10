import 'package:campus_flutter/navigaTumComponent/model/navigatum_roomfinder_map.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navigatum_roomfinder_maps.g.dart';

@JsonSerializable()
class NavigaTumRoomFinderMaps {
  final List<NavigaTumRoomFinderMap> available;
  @JsonKey(name: "default")
  final String defaultMapId;

  NavigaTumRoomFinderMaps(this.available, this.defaultMapId);

  factory NavigaTumRoomFinderMaps.fromJson(Map<String, dynamic> json) =>
      _$NavigaTumRoomFinderMapsFromJson(json);

  Map<String, dynamic> toJson() => _$NavigaTumRoomFinderMapsToJson(this);
}
