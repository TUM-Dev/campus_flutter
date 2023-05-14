// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organisation _$OrganisationFromJson(Map<String, dynamic> json) => Organisation(
      name: json['org'] as String,
      id: json['kennung'] as String,
      number: json['org_nr'] as String,
      title: json['titel'] as String,
      description: json['beschreibung'] as String,
    );

Map<String, dynamic> _$OrganisationToJson(Organisation instance) =>
    <String, dynamic>{
      'org': instance.name,
      'kennung': instance.id,
      'org_nr': instance.number,
      'titel': instance.title,
      'beschreibung': instance.description,
    };
