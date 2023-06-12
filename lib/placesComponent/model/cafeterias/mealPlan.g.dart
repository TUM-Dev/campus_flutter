// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mealPlan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealPlan _$MealPlanFromJson(Map<String, dynamic> json) => MealPlan(
      week: json['number'] as int,
      year: json['year'] as int,
      days: (json['days'] as List<dynamic>)
          .map((e) => MensaMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealPlanToJson(MealPlan instance) => <String, dynamic>{
      'number': instance.week,
      'year': instance.year,
      'days': instance.days,
    };
