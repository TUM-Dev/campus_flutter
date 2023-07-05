import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/departuresComponent/model/station.dart';
import 'package:json_annotation/json_annotation.dart';

part 'departures_preference.g.dart';

@JsonSerializable()
class DeparturesPreference {
  final Map<Campus, Station> preferences;

  DeparturesPreference({required this.preferences});

  factory DeparturesPreference.fromJson(Map<String, dynamic> json) => _$DeparturesPreferenceFromJson(json);

  Map<String, dynamic> toJson() => _$DeparturesPreferenceToJson(this);
}