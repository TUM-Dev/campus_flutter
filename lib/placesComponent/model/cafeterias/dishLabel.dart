import 'package:json_annotation/json_annotation.dart';

part 'dishLabel.g.dart';

@JsonSerializable()
class DishLabel {
  @JsonKey(name: "enum_name")
  final String name;
  final Map<String, String> text;
  final String abbreviation;

  DishLabel({required this.name, required this.text, required this.abbreviation});

  factory DishLabel.fromJson(Map<String, dynamic> json) => _$DishLabelFromJson(json);

  Map<String, dynamic> toJson() => _$DishLabelToJson(this);
}