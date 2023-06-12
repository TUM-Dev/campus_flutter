import 'package:campus_flutter/placesComponent/model/cafeterias/mensaMenu.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mealPlan.g.dart';

@JsonSerializable()
class MealPlan {
  @JsonKey(name: "number")
  final int week;
  final int year;
  final List<MensaMenu> days;
  
  MealPlan({required this.week, required this.year, required this.days});

  factory MealPlan.fromJson(Map<String, dynamic> json) => _$MealPlanFromJson(json);

  Map<String, dynamic> toJson() => _$MealPlanToJson(this);
}