// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Station _$StationFromJson(Map<String, dynamic> json) => Station(
  name: json['name'] as String,
  apiName: json['apiName'] as String,
  location: LatLng.fromJson(json['location']),
);

Map<String, dynamic> _$StationToJson(Station instance) => <String, dynamic>{
  'name': instance.name,
  'apiName': instance.apiName,
  'location': JsonString.toJsonString(instance.location),
};
