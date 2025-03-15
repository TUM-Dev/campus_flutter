// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
  number: json['nummer'] as String?,
  buildingName: json['gebaeudename'] as String?,
  buildingNumber: json['gebaeudenummer'] as String?,
  floorName: json['stockwerkname'] as String?,
  floorNumber: json['stockwerknummer'] as String?,
  id: json['architekt'] as String?,
  locationDescription: json['ortsbeschreibung'] as String?,
  shortLocationDescription: json['kurz'] as String?,
  longLocationDescription: json['lang'] as String?,
);

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
  'nummer': instance.number,
  'gebaeudename': instance.buildingName,
  'gebaeudenummer': instance.buildingNumber,
  'stockwerkname': instance.floorName,
  'stockwerknummer': instance.floorNumber,
  'architekt': instance.id,
  'ortsbeschreibung': instance.locationDescription,
  'kurz': instance.shortLocationDescription,
  'lang': instance.longLocationDescription,
};
