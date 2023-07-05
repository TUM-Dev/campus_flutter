import 'package:campus_flutter/base/classes/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'station.g.dart';

@JsonSerializable()
/// local data type
class Station {
  final String name;
  final String apiName;
  final Location? location;

  Station({
    required this.name,
    required this.apiName,
    this.location
  });

  factory Station.fromJson(Map<String, dynamic> json) => _$StationFromJson(json);

  Map<String, dynamic> toJson() => _$StationToJson(this);
}