import 'package:campus_flutter/navigaTumComponent/model/details/navigatum_overlays_maps.dart';
import 'package:campus_flutter/navigaTumComponent/model/details/navigatum_roomfinder_maps.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navigatum_navigation_maps.g.dart';

@JsonSerializable()
class NavigaTumNavigationMaps {
  @JsonKey(name: "default")
  final String defaultMapId;
  final NavigaTumRoomFinderMaps? roomfinder;
  final NavigaTumOverlayMaps? overlays;

  NavigaTumNavigationMaps(this.defaultMapId, this.roomfinder, this.overlays);

  factory NavigaTumNavigationMaps.fromJson(Map<String, dynamic> json) =>
      _$NavigaTumNavigationMapsFromJson(json);

  Map<String, dynamic> toJson() => _$NavigaTumNavigationMapsToJson(this);
}
