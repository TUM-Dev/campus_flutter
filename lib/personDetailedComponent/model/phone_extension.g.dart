// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_extension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneExtension _$PhoneExtensionFromJson(Map<String, dynamic> json) =>
    PhoneExtension(
      phoneNumber: json['telefonnummer'] as String,
      countryCode: json['tum_anlage_land'] as String,
      areaCode: json['tum_anlage_ortsvorwahl'] as String,
      equipmentNumber: json['tum_anlage_nummer'] as String,
      branchNumber: json['tum_nebenstelle'] as String,
    );

Map<String, dynamic> _$PhoneExtensionToJson(PhoneExtension instance) =>
    <String, dynamic>{
      'telefonnummer': instance.phoneNumber,
      'tum_anlage_land': instance.countryCode,
      'tum_anlage_ortsvorwahl': instance.areaCode,
      'tum_anlage_nummer': instance.equipmentNumber,
      'tum_nebenstelle': instance.branchNumber,
    };
