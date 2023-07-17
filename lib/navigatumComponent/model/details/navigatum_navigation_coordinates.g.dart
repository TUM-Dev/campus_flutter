// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigatum_navigation_coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigaTumNavigationCoordinates _$NavigaTumNavigationCoordinatesFromJson(
        Map<String, dynamic> json) =>
    NavigaTumNavigationCoordinates(
      StringParser.stringToDouble(json['lat'] as String?),
      StringParser.stringToDouble(json['long'] as String?),
    );

Map<String, dynamic> _$NavigaTumNavigationCoordinatesToJson(
        NavigaTumNavigationCoordinates instance) =>
    <String, dynamic>{
      'lat': instance.latitude,
      'long': instance.longitude,
    };
