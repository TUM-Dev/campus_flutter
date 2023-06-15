import 'package:json_annotation/json_annotation.dart';

part 'station.g.dart';

@JsonSerializable()
/// local data type
class Station {
  final String name;
  final String apiName;
  final double latitude;
  final double longitude;

  Station({
    required this.name,
    required this.apiName,
    required this.latitude,
    required this.longitude
  });

  factory Station.fromJson(Map<String, dynamic> json) => _$StationFromJson(json);

  Map<String, dynamic> toJson() => _$StationToJson(this);
}