// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigatum_navigation_coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigaTumNavigationCoordinates _$NavigaTumNavigationCoordinatesFromJson(
        Map<String, dynamic> json) =>
    NavigaTumNavigationCoordinates(
      (json['lat'] as num?)?.toDouble(),
      (json['long'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NavigaTumNavigationCoordinatesToJson(
        NavigaTumNavigationCoordinates instance) =>
    <String, dynamic>{
      'lat': instance.latitude,
      'long': instance.longitude,
    };
