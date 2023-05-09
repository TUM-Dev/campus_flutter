import 'package:campus_flutter/base/Networking/Protocols/apiResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tuition.g.dart';

@JsonSerializable()
class Tuition implements Serializable {
  @JsonKey(name: "soll")
  final double? amount;
  @JsonKey(name: "frist")
  final DateTime? deadline;
  @JsonKey(name: "semester_bezeichnung")
  final String? semester;
  @JsonKey(name: "semester_id")
  final String? semesterID;

  Tuition({
    this.amount,
    this.deadline,
    this.semester,
    this.semesterID
  });

  factory Tuition.fromJson(Map<String, dynamic> json) => _$TuitionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TuitionToJson(this);
}

@JsonSerializable()
class TuitionData implements Serializable {
  @JsonKey(name: "rowset")
  Tuitions profilesAttribute;

  TuitionData({required this.profilesAttribute});

  factory TuitionData.fromJson(Map<String, dynamic> json) => _$TuitionDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TuitionDataToJson(this);
}

@JsonSerializable()
class Tuitions implements Serializable {
  @JsonKey(name: "row")
  final List<Tuition> tuitions;

  Tuitions({required this.tuitions});

  factory Tuitions.fromJson(Map<String, dynamic> json) => _$TuitionsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TuitionsToJson(this);
}