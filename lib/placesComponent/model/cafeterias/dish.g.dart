// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      name: json['name'] as String,
      prices: (json['prices'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Price.fromJson(e as Map<String, dynamic>)),
      ),
      labels:
          (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
      dishType: json['dish_type'] as String,
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'name': instance.name,
      'prices': instance.prices,
      'labels': instance.labels,
      'dish_type': instance.dishType,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      basePrice: (json['base_price'] as num?)?.toDouble(),
      unitPrice: (json['price_per_unit'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'base_price': instance.basePrice,
      'price_per_unit': instance.unitPrice,
      'unit': instance.unit,
    };
