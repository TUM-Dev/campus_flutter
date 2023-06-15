// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departuresPreference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeparturesPreference _$DeparturesPreferenceFromJson(
        Map<String, dynamic> json) =>
    DeparturesPreference(
      preferences: (json['preferences'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$CampusEnumMap, k),
            Station.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$DeparturesPreferenceToJson(
        DeparturesPreference instance) =>
    <String, dynamic>{
      'preferences':
          instance.preferences.map((k, e) => MapEntry(_$CampusEnumMap[k]!, e)),
    };

const _$CampusEnumMap = {
  Campus.stammgelaende: 'stammgelaende',
  Campus.olympiapark: 'olympiapark',
  Campus.klinikumRechts: 'klinikumRechts',
  Campus.grosshadern: 'grosshadern',
  Campus.garching: 'garching',
  Campus.freising: 'freising',
};
