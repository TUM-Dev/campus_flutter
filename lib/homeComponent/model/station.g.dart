// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Station _$StationFromJson(Map<String, dynamic> json) => Station(
  name: json['name'] as String,
  apiName: json['apiName'] as String,
  location: LatLngJson.fromJsonString(json['location'] as List),
);

Map<String, dynamic> _$StationToJson(Station instance) => <String, dynamic>{
  'name': instance.name,
  'apiName': instance.apiName,
  'location': LatLngJson.toJsonString(instance.location),
};
