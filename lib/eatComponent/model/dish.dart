import 'package:json_annotation/json_annotation.dart';

import '../../base/networking/protocols/apiResponse.dart';

part 'dish.g.dart';

@JsonSerializable()
class Dish implements Serializable {
  final String name;
  final Map<String, Price> prices;
  final List<String> labels;
  @JsonKey(name: "dish_type")
  final String dishType;
  
  Dish({required this.name, required this.prices, required this.labels, required this.dishType});

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DishToJson(this);
}

@JsonSerializable()
class Price implements Serializable {
  final double? basePrice;
  final double? unitPrice;
  final String? unit;

  Price({this.basePrice, this.unitPrice, this.unit});

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}