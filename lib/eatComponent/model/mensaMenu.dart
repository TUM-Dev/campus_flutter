import 'package:json_annotation/json_annotation.dart';

import '../../base/networking/protocols/apiResponse.dart';
import 'dish.dart';

part 'mensaMenu.g.dart';

@JsonSerializable()
class MensaMenu implements Serializable {
  final DateTime date;
  final List<Dish> dishes;
  
  MensaMenu({required this.date, required this.dishes});

  factory MensaMenu.fromJson(Map<String, dynamic> json) => _$MensaMenuFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MensaMenuToJson(this);
}

@JsonSerializable()
class Category implements Serializable {
  final String name;
  final List<Dish> dishes;

  Category({required this.name, required this.dishes});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}