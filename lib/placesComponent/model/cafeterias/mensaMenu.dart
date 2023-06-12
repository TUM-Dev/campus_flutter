import 'package:campus_flutter/placesComponent/model/cafeterias/dish.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mensaMenu.g.dart';

@JsonSerializable()
class MensaMenu {
  final DateTime date;
  final List<Dish> dishes;
  
  MensaMenu({required this.date, required this.dishes});

  factory MensaMenu.fromJson(Map<String, dynamic> json) => _$MensaMenuFromJson(json);

  Map<String, dynamic> toJson() => _$MensaMenuToJson(this);
}

@JsonSerializable()
class Category {
  final String name;
  final List<Dish> dishes;

  Category({required this.name, required this.dishes});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}