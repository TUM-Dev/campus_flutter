import 'package:campus_flutter/base/networking/protocols/apiResponse.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mensaMenu.dart';

part 'mealPlan.g.dart';

@JsonSerializable()
class MealPlan implements Serializable {
  @JsonKey(name: "number")
  final int week;
  final int year;
  final List<MensaMenu> days;
  
  MealPlan({required this.week, required this.year, required this.days});

  factory MealPlan.fromJson(Map<String, dynamic> json) => _$MealPlanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MealPlanToJson(this);
}