import 'package:campus_flutter/base/networking/protocols/apiResponse.dart';
import 'package:geolocator/geolocator.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cafeteria.g.dart';

@JsonSerializable()
class Location implements Serializable {
  final double latitude;
  final double longitude;
  final String address;

  Location({required this.latitude, required this.longitude, required this.address});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Queue implements Serializable {
  final int current;
  final int percent;

  Queue({required this.current, required this.percent});

  factory Queue.fromJson(Map<String, dynamic> json) => _$QueueFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$QueueToJson(this);
}

@JsonSerializable()
class Cafeteria implements Serializable {
  final Location location;
  String name;
  @JsonKey(name: "canteen_id")
  String id;
  @JsonKey(name: "queue_status")
  final String queueStatusApi;
  Queue queue;
  String? get title {
    return name;
  }

  Cafeteria({required this.location, required this.name, required this.id, required this.queueStatusApi, required this.queue});

  factory Cafeteria.fromJson(Map<String, dynamic> json) => _$CafeteriaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CafeteriaToJson(this);
}

extension on List<Cafeteria> {
  sortByDistance(Location location) {
    sort((a, b) {
      return Geolocator.distanceBetween(location.latitude, location.longitude,
              a.location.latitude, a.location.longitude)
          .compareTo(Geolocator.distanceBetween(location.latitude,
              location.longitude, a.location.latitude, a.location.longitude));
    });
  }
}