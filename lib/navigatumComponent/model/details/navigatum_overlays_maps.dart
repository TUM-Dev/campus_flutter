import 'package:campus_flutter/navigatumComponent/model/navigatum_overlay_map.dart';
import 'package:json_annotation/json_annotation.dart';

part 'navigatum_overlays_maps.g.dart';

@JsonSerializable()
class NavigaTumOverlayMaps {
  final List<NavigaTumOverlayMap> available;

  NavigaTumOverlayMaps(this.available);

  factory NavigaTumOverlayMaps.fromJson(Map<String, dynamic> json) =>
      _$NavigaTumOverlayMapsFromJson(json);

  Map<String, dynamic> toJson() => _$NavigaTumOverlayMapsToJson(this);
}
