// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) => ContactInfo(
  phone: json['telefon'] as String?,
  fax: json['fax'] as String?,
  mobilePhone: json['mobiltelefon'] as String?,
  additionalInfo: json['zusatz_info'] as String?,
  homepage: json['www_homepage'] as String?,
);

Map<String, dynamic> _$ContactInfoToJson(ContactInfo instance) =>
    <String, dynamic>{
      'telefon': instance.phone,
      'fax': instance.fax,
      'mobiltelefon': instance.mobilePhone,
      'zusatz_info': instance.additionalInfo,
      'www_homepage': instance.homepage,
    };
