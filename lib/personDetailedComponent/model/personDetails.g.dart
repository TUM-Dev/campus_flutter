// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDetails _$PersonDetailsFromJson(Map<String, dynamic> json) =>
    PersonDetails(
      nr: json['nr'] as String,
      obfuscatedID: json['obfuscated_id'] as String,
      firstName: json['vorname'] as String,
      name: json['familienname'] as String,
      title: json['titel'] as String?,
      email: json['email'] as String,
      gender: PersonDetails._stringToGender(json['geschlecht'] as String),
      officeHours: json['sprechstunde'] as String?,
      imageData: json['image_data'] as String?,
      organisations: PersonDetails._jsonToOrganisationList(json['gruppen']),
      rooms: PersonDetails._jsonToRoomList(json['raeume']),
      phoneExtensions: (json['telefon_nebenstellen'] as List<dynamic>?)
          ?.map((e) => PhoneExtension.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonDetailsToJson(PersonDetails instance) =>
    <String, dynamic>{
      'nr': instance.nr,
      'obfuscated_id': instance.obfuscatedID,
      'vorname': instance.firstName,
      'familienname': instance.name,
      'titel': instance.title,
      'email': instance.email,
      'geschlecht': _$GenderEnumMap[instance.gender]!,
      'sprechstunde': instance.officeHours,
      'image_data': instance.imageData,
      'gruppen': instance.organisations,
      'raeume': instance.rooms,
      'telefon_nebenstellen': instance.phoneExtensions,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.nonBinary: 'nonBinary',
  Gender.unknown: 'unknown',
};

PersonDetailsData _$PersonDetailsDataFromJson(Map<String, dynamic> json) =>
    PersonDetailsData(
      person: PersonDetails.fromJson(json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonDetailsDataToJson(PersonDetailsData instance) =>
    <String, dynamic>{
      'person': instance.person,
    };
