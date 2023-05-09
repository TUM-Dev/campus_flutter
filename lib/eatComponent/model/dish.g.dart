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
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      unitPrice: (json['unitPrice'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'basePrice': instance.basePrice,
      'unitPrice': instance.unitPrice,
      'unit': instance.unit,
    };
