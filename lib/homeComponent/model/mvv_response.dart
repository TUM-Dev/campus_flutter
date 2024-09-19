import 'package:campus_flutter/homeComponent/model/departure.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mvv_response.g.dart';

@JsonSerializable()
class MvvResponse {
  @JsonKey(name: "departureList", readValue: readDepartures)
  final List<Departure> departures;

  MvvResponse({required this.departures});

  factory MvvResponse.fromJson(Map<String, dynamic> json) =>
      _$MvvResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MvvResponseToJson(this);

  static List<dynamic> readDepartures(Map<dynamic, dynamic> data, String key) {
    final relevantData = data[key];
    if (relevantData is List<dynamic>) {
      return relevantData;
    } else if (relevantData is Map<String, dynamic>) {
      return [relevantData["departure"]];
    } else {
      return [];
    }
  }
}
