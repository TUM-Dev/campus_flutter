import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/placesComponent/model/maps/marker.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_data.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/services/study_rooms_service.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

final studyRoomsViewModel = Provider((ref) => StudyRoomsViewModel());

class StudyRoomsViewModel {
  BehaviorSubject<Map<Campus, List<StudyRoomGroup>>?> campusStudyRooms =
      BehaviorSubject.seeded(null);
  BehaviorSubject<Map<StudyRoomGroup, List<StudyRoom>>?> studyRooms =
      BehaviorSubject.seeded(null);
  BehaviorSubject<StudyRoomGroup?> widgetStudyRoom = BehaviorSubject.seeded(
    null,
  );

  Future<void> setWidgetStudyRoom(int id) async {
    final newStudyRoom = studyRoomData?.groups?.firstWhereOrNull(
      (element) => element.id == id,
    );
    if (newStudyRoom != null) {
      widgetStudyRoom.add(newStudyRoom);
      getIt<UserPreferencesService>().save(UserPreference.studyRoom, id);
    }
  }

  StudyRoomData? studyRoomData;
  DateTime? lastFetched;

  Future fetch(bool forcedRefresh) async {
    return StudyRoomsService.fetchStudyRooms(forcedRefresh).then(
      (value) {
        lastFetched = value.$1;
        studyRoomData = value.$2;
        _categorizeAndSort();
      },
      onError: (Object error, StackTrace stack) =>
          studyRooms.addError(error, stack),
    );
  }

  bool widgetStudyRoomLoaded = false;

  Future<void> fetchWidgetStudyRooms(
    bool forcedRefresh,
    BuildContext context,
  ) async {
    widgetStudyRoomLoaded = false;
    widgetStudyRoom.add(null);
    try {
      final preferenceId = getIt<UserPreferencesService>().load(
        UserPreference.studyRoom,
      );
      final response = await StudyRoomsService.fetchStudyRooms(forcedRefresh);
      lastFetched = response.$1;
      studyRoomData = response.$2;
      _categorizeAndSort();
      final groups = response.$2.groups ?? <StudyRoomGroup>[];
      if (groups.isEmpty) {
        widgetStudyRoomLoaded = true;
        widgetStudyRoom.add(null);
        return;
      }
      final selected = groups.firstWhereOrNull(
        (group) => group.id == preferenceId,
      );
      if (selected != null) {
        widgetStudyRoomLoaded = true;
        widgetStudyRoom.add(selected);
        return;
      }
      final position = await LocationService.getLastKnown();
      if (!context.mounted) return;
      widgetStudyRoomLoaded = true;
      if (position == null) {
        widgetStudyRoom.add(
          groups.firstWhereOrNull((group) => group.id == 97) ?? groups.first,
        );
        return;
      }
      final closest = groups.reduce((current, next) {
        double distance(StudyRoomGroup group) => group.coordinate == null
            ? double.infinity
            : Geolocator.distanceBetween(
                group.coordinate!.latitude,
                group.coordinate!.longitude,
                position.latitude,
                position.longitude,
              );
        return distance(current) <= distance(next) ? current : next;
      });
      widgetStudyRoom.add(closest);
    } catch (error, stack) {
      widgetStudyRoom.addError(error, stack);
    }
  }

  void _categorizeAndSort() {
    final studyRooms = _categorizeAndSortRooms();
    final campusStudyRooms = _categorizeAndSortCampus();
    this.studyRooms.add(studyRooms);
    this.campusStudyRooms.add(campusStudyRooms);
  }

  Map<StudyRoomGroup, List<StudyRoom>> _categorizeAndSortRooms() {
    Map<StudyRoomGroup, List<StudyRoom>> studyRooms = {};
    for (var group in studyRoomData?.groups ?? []) {
      final rooms = group.getRooms(studyRoomData?.rooms ?? []);
      rooms.sort((room1, room2) {
        Map<String, int> statusOrder = {
          "frei": 0,
          "WAAS": 1,
          "belegt": 2,
          "unbekannt": 3,
        };
        int statusValue1 = statusOrder[room1.status] ?? 4;
        int statusValue2 = statusOrder[room2.status] ?? 4;
        return statusValue1.compareTo(statusValue2);
      });
      studyRooms[group] = rooms;
    }
    return studyRooms;
  }

  Map<Campus, List<StudyRoomGroup>> _categorizeAndSortCampus() {
    Map<Campus, List<StudyRoomGroup>> campusStudyRooms = {};
    for (var campus in Campus.values) {
      if (studyRoomData?.groups != null) {
        List<StudyRoomGroup> groups = studyRoomData!.groups!;
        groups = groups.where((element) {
          if (element.coordinate != null) {
            return Geolocator.distanceBetween(
                  campus.location.latitude,
                  campus.location.longitude,
                  element.coordinate!.latitude,
                  element.coordinate!.longitude,
                ) <=
                1000;
          } else {
            return false;
          }
        }).toList();

        campusStudyRooms[campus] = groups;
      }
    }
    return campusStudyRooms;
  }

  int freeRooms(StudyRoomGroup studyRoomGroup) {
    List<StudyRoom> data = studyRooms.value?[studyRoomGroup] ?? [];
    return data.where((element) => element.isAvailable).length;
  }

  List<ListTile> getStudyRoomEntries(BuildContext context) {
    return studyRooms.value?.entries.map((e) {
            final isSelected =
                widgetStudyRoom.value?.id == e.key.id &&
                getIt<UserPreferencesService>().load(
                      UserPreference.studyRoom,
                    ) !=
                    null;
            return ListTile(
              dense: true,
              title: Text(e.key.name),
              trailing: isSelected ? const Icon(Icons.check) : null,
              onTap: () {
                setWidgetStudyRoom(e.key.id);
                context.pop();
              },
            );
          }).toList() ??
          []
      ..insert(
        0,
        ListTile(
          dense: true,
          title: Text(context.tr("closest")),
          trailing:
              getIt<UserPreferencesService>().load(UserPreference.studyRoom) ==
                  null
              ? const Icon(Icons.check)
              : null,
          onTap: () {
            getIt<UserPreferencesService>().reset(UserPreference.studyRoom);
            fetchWidgetStudyRooms(false, context);
            context.pop();
          },
        ),
      );
  }

  Set<Marker> mapMakers(BuildContext context) {
    if (studyRoomData?.groups != null && studyRoomData!.groups!.isNotEmpty) {
      return studyRoomData!.groups!
          .where((element) => element.coordinate != null)
          .map(
            (e) => Marker(
              id: const Uuid().v4(),
              position: LatLng(e.coordinate!.latitude, e.coordinate!.longitude),
              infoWindow: InfoWindow(
                title: e.name,
                onTap: () => context.push(studyRoom, extra: e),
              ),
            ),
          )
          .toSet();
    } else {
      return {};
    }
  }

  Set<Marker> mapMakersCampus(BuildContext context, Campus campus) {
    if (campusStudyRooms.value != null) {
      return (campusStudyRooms.value![campus] ?? [])
          .where((element) => element.coordinate != null)
          .map(
            (e) => Marker(
              id: e.id.toString(),
              position: LatLng(e.coordinate!.latitude, e.coordinate!.longitude),
              infoWindow: InfoWindow(
                title: e.name,
                onTap: () => context.push(studyRoom, extra: e),
              ),
            ),
          )
          .toSet();
    } else {
      return {};
    }
  }
}
