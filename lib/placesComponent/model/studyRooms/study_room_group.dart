import 'package:campus_flutter/base/util/read_list_value.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_opening_hours.dart';
import 'package:campus_flutter/searchComponent/model/comparison_token.dart';
import 'package:campus_flutter/searchComponent/protocols/searchable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'study_room_group.g.dart';

@JsonSerializable()
class StudyRoomGroup extends Searchable {
  final String? detail;
  @JsonKey(name: "nr")
  final int id;
  final String name;
  @JsonKey(name: "sortierung")
  final int sorting;
  @JsonKey(name: "raeume")
  final List<int>? rooms;
  @JsonKey(name: "opening_hours", readValue: readListValue)
  final List<StudyRoomOpeningHours> openingHours;

  (String, String)? get openToday {
    final currentDay = DateTime.now().weekday;
    for (var openingHour in openingHours) {
      if (openingHour.days.contains(currentDay)) {
        return (openingHour.startString, openingHour.endString);
      }
    }
    return null;
  }

  bool get isOpen {
    final now = DateTime.now();
    final currentDay = now.weekday;
    for (var openingHour in openingHours) {
      if (openingHour.days.contains(currentDay)) {
        return now.hour >= openingHour.startTime &&
            now.hour <= openingHour.endTime;
      }
    }
    return false;
  }

  LatLng? get coordinate {
    switch (id) {
      case 44:
        return const LatLng(
          48.24926355557732,
          11.633834370828435,
        );
      case 46:
        return const LatLng(48.2629811953867, 11.6668123);
      case 47:
        return const LatLng(
          48.26250533403169,
          11.668024666454896,
        );
      case 60:
        return const LatLng(
          48.14778663798231,
          11.56695764027295,
        );
      case 97:
        return const LatLng(
          48.26696368721545,
          11.670222023419445,
        );
      case 130:
        return const LatLng(
          48.39535098293569,
          11.724272313959853,
        );
      default:
        return null;
    }
  }

  List<StudyRoom> getRooms(List<StudyRoom> allRooms) {
    return allRooms
        .where((element) => rooms?.contains(element.id) ?? false)
        .toList();
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ComparisonToken> get comparisonTokens => [
        ComparisonToken(value: name),
        ComparisonToken(value: detail ?? ""),
      ];

  StudyRoomGroup({
    this.detail,
    required this.id,
    required this.name,
    required this.sorting,
    this.rooms,
    required this.openingHours,
  });

  factory StudyRoomGroup.fromJson(Map<String, dynamic> json) =>
      _$StudyRoomGroupFromJson(json);

  Map<String, dynamic> toJson() => _$StudyRoomGroupToJson(this);
}
