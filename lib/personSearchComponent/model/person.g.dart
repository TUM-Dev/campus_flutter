// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      firstname: json['vorname'] as String,
      surname: json['familienname'] as String,
      title: json['titel'] as String?,
      nr: json['nr'] as String,
      obfuscatedID: json['obfuscated_id'] as String,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'vorname': instance.firstname,
      'familienname': instance.surname,
      'titel': instance.title,
      'nr': instance.nr,
      'obfuscated_id': instance.obfuscatedID,
    };

PersonData _$PersonDataFromJson(Map<String, dynamic> json) => PersonData(
      personAttribute: json['rowset'] == null
          ? null
          : Persons.fromJson(json['rowset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonDataToJson(PersonData instance) =>
    <String, dynamic>{
      'rowset': instance.personAttribute,
    };

Persons _$PersonsFromJson(Map<String, dynamic> json) => Persons(
      persons: (json['row'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonsToJson(Persons instance) => <String, dynamic>{
      'row': instance.persons,
    };
