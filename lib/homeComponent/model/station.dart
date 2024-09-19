import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:campus_flutter/base/extensions/latlng_to_json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'station.g.dart';

@JsonSerializable()

/// local data type
class Station {
  final String name;
  final String apiName;
  @JsonKey(fromJson: LatLng.fromJson, toJson: JsonString.toJsonString)
  final LatLng? location;

  Station({required this.name, required this.apiName, this.location});

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);

  Map<String, dynamic> toJson() => _$StationToJson(this);
}
