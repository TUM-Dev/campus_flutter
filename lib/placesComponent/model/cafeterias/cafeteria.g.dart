// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafeteria.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
    };

Queue _$QueueFromJson(Map<String, dynamic> json) => Queue(
      current: (json['current'] as num).toInt(),
      percent: (json['percent'] as num).toInt(),
    );

Map<String, dynamic> _$QueueToJson(Queue instance) => <String, dynamic>{
      'current': instance.current,
      'percent': instance.percent,
    };

Cafeteria _$CafeteriaFromJson(Map<String, dynamic> json) => Cafeteria(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      name: json['name'] as String,
      id: json['canteen_id'] as String,
      queueStatusApi: json['queue_status'] as String?,
      queue: json['queue'] == null
          ? null
          : Queue.fromJson(json['queue'] as Map<String, dynamic>),
      openingHours: json['open_hours'] == null
          ? null
          : OpeningHours.fromJson(json['open_hours'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CafeteriaToJson(Cafeteria instance) => <String, dynamic>{
      'location': instance.location,
      'name': instance.name,
      'canteen_id': instance.id,
      'queue_status': instance.queueStatusApi,
      'queue': instance.queue,
      'open_hours': instance.openingHours,
    };

Cafeterias _$CafeteriasFromJson(Map<String, dynamic> json) => Cafeterias(
      cafeterias: (json['data'] as List<dynamic>)
          .map((e) => Cafeteria.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CafeteriasToJson(Cafeterias instance) =>
    <String, dynamic>{
      'data': instance.cafeterias,
    };
