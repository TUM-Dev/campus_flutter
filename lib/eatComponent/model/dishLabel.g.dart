// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dishLabel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishLabel _$DishLabelFromJson(Map<String, dynamic> json) => DishLabel(
      name: json['enum_name'] as String,
      text: Map<String, String>.from(json['text'] as Map),
      abbreviation: json['abbreviation'] as String,
    );

Map<String, dynamic> _$DishLabelToJson(DishLabel instance) => <String, dynamic>{
      'enum_name': instance.name,
      'text': instance.text,
      'abbreviation': instance.abbreviation,
    };
