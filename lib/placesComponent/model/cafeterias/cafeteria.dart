import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cafeteria.g.dart';

@JsonSerializable()
class Location {
  final double latitude;
  final double longitude;
  final String address;

  Location(
      {required this.latitude, required this.longitude, required this.address});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Queue {
  final int current;
  final int percent;

  Queue({required this.current, required this.percent});

  factory Queue.fromJson(Map<String, dynamic> json) => _$QueueFromJson(json);

  Map<String, dynamic> toJson() => _$QueueToJson(this);
}

@JsonSerializable()
class Cafeteria extends Searchable {
  final Location location;
  String name;
  @JsonKey(name: "canteen_id")
  String id;
  @JsonKey(name: "queue_status")
  final String? queueStatusApi;
  Queue? queue;

  String? get title {
    return name;
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ComparisonToken> get comparisonTokens => [
        ComparisonToken(value: name),
        ComparisonToken(value: location.address),
        ComparisonToken(
            value: location.latitude.toString(), type: ComparisonTokenType.raw),
        ComparisonToken(
            value: location.longitude.toString(), type: ComparisonTokenType.raw)
      ];

  Cafeteria(
      {required this.location,
      required this.name,
      required this.id,
      required this.queueStatusApi,
      required this.queue});

  factory Cafeteria.fromJson(Map<String, dynamic> json) =>
      _$CafeteriaFromJson(json);

  Map<String, dynamic> toJson() => _$CafeteriaToJson(this);
}

@JsonSerializable()
class Cafeterias {
  @JsonKey(name: "data")
  final List<Cafeteria> cafeterias;

  Cafeterias({required this.cafeterias});

  factory Cafeterias.fromJson(Map<String, dynamic> json) =>
      _$CafeteriasFromJson(json);

  Map<String, dynamic> toJson() => _$CafeteriasToJson(this);
}
