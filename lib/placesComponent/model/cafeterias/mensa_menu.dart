import 'package:campus_flutter/placesComponent/model/cafeterias/dish.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mensa_menu.g.dart';

@JsonSerializable()
class MensaMenu {
  final DateTime date;
  final List<Dish> dishes;
  
  MensaMenu({required this.date, required this.dishes});

  factory MensaMenu.fromJson(Map<String, dynamic> json) => _$MensaMenuFromJson(json);

  Map<String, dynamic> toJson() => _$MensaMenuToJson(this);
}

@JsonSerializable()
class MenuCategory {
  final String name;
  final List<Dish> dishes;

  MenuCategory({required this.name, required this.dishes});

  factory MenuCategory.fromJson(Map<String, dynamic> json) => _$MenuCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MenuCategoryToJson(this);
}