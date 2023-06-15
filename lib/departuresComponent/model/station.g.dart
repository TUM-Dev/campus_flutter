// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Station _$StationFromJson(Map<String, dynamic> json) => Station(
      name: json['name'] as String,
      apiName: json['apiName'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$StationToJson(Station instance) => <String, dynamic>{
      'name': instance.name,
      'apiName': instance.apiName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
