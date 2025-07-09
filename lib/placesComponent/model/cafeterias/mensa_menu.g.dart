// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mensa_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MensaMenu _$MensaMenuFromJson(Map<String, dynamic> json) => MensaMenu(
  date: DateTime.parse(json['date'] as String),
  dishes: (json['dishes'] as List<dynamic>)
      .map((e) => Dish.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MensaMenuToJson(MensaMenu instance) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'dishes': instance.dishes,
};

MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) => MenuCategory(
  name: json['name'] as String,
  dishes: (json['dishes'] as List<dynamic>)
      .map((e) => Dish.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MenuCategoryToJson(MenuCategory instance) =>
    <String, dynamic>{'name': instance.name, 'dishes': instance.dishes};
