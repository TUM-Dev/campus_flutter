import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_data.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/services/study_rooms_service.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_room_group_scaffold.dart';
import 'package:campus_flutter/settingsComponent/service/user_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

final studyRoomsViewModel = Provider((ref) => StudyRoomsViewModel());

class StudyRoomsViewModel {
  BehaviorSubject<Map<Campus, List<StudyRoomGroup>>?> campusStudyRooms =
      BehaviorSubject.seeded(null);
  BehaviorSubject<Map<StudyRoomGroup, List<StudyRoom>>?> studyRooms =
      BehaviorSubject.seeded(null);
  BehaviorSubject<StudyRoomGroup?> widgetStudyRoom =
      BehaviorSubject.seeded(null);

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
      onError: (error) => studyRooms.addError(error),
    );
  }

  Future<void> fetchWidgetStudyRooms(bool forcedRefresh) async {
    final preferenceId = getIt<UserPreferencesService>().load(
      UserPreference.studyRoom,
    );

    return StudyRoomsService.fetchStudyRooms(forcedRefresh).then(
      (value) {
        lastFetched = value.$1;
        studyRoomData = value.$2;
        _categorizeAndSort();
        final selectedStudyRoom = value.$2.groups?.firstWhereOrNull(
          (element) => element.id == preferenceId,
        );
        if (selectedStudyRoom != null) {
          widgetStudyRoom.add(selectedStudyRoom);
        } else {
          LocationService.getLastKnown().then(
            (position) => _getClosestStudyRoomGroup(position),
            onError: (error) => widgetStudyRoom.addError(error),
          );
        }
      },
      onError: (error) => widgetStudyRoom.addError(error),
    );
  }

  _getClosestStudyRoomGroup(Position? position) {
    if (studyRoomData?.groups == null) {
      // TODO: localize
      widgetStudyRoom.addError("Could not get closest study rooms!");
      return;
    }

    if (position == null) {
      final defaultStudyRoom = studyRoomData?.groups?.firstWhereOrNull(
            (element) => element.id == 97,
          ) ??
          studyRoomData?.groups?.firstOrNull;
      if (defaultStudyRoom == null) {
        // TODO: localize
        widgetStudyRoom.addError("Could not get closest study rooms!");
      } else {
        widgetStudyRoom.add(defaultStudyRoom);
      }
    }

    final group = studyRoomData?.groups?.reduce((currentGroup, nextGroup) {
      final distanceCurrent = currentGroup.coordinate != null
          ? Geolocator.distanceBetween(
              currentGroup.coordinate!.latitude,
              currentGroup.coordinate!.longitude,
              position!.latitude,
              position.longitude,
            )
          : 0.0;

      final distanceNext = nextGroup.coordinate != null
          ? Geolocator.distanceBetween(
              nextGroup.coordinate!.latitude,
              nextGroup.coordinate!.longitude,
              position!.latitude,
              position.longitude,
            )
          : 0.0;

      if (distanceCurrent < distanceNext) {
        return currentGroup;
      } else {
        return nextGroup;
      }
    });

    widgetStudyRoom.add(group);
  }

  _categorizeAndSort() {
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
          "belegt": 1,
          "unbekannt": 2,
        };
        int statusValue1 = statusOrder[room1.status] ?? 3;
        int statusValue2 = statusOrder[room2.status] ?? 3;
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
    return data.where((element) => element.status == "frei").length;
  }

  List<PopupMenuEntry<int>> getMenuEntries() {
    return studyRoomData?.groups?.map((e) {
          final selectedCafeteriaId = widgetStudyRoom.value != null
              ? widgetStudyRoom.value!.id
              : studyRoomData?.groups?.first.id;
          final name = e.name;
          final cafeteriaId = e.id;
          return PopupMenuItem(
            value: cafeteriaId,
            child: selectedCafeteriaId == cafeteriaId
                ? IconText(
                    iconData: Icons.check,
                    label: name,
                    leadingIcon: false,
                  )
                : Text(name),
          );
        }).toList() ??
        [];
  }

  Set<Marker> mapMakers(BuildContext context) {
    if (studyRoomData?.groups != null && studyRoomData!.groups!.isNotEmpty) {
      return studyRoomData!.groups!
          .where((element) => element.coordinate != null)
          .map(
            (e) => Marker(
              markerId: MarkerId(const Uuid().v4()),
              position: LatLng(e.coordinate!.latitude, e.coordinate!.longitude),
              infoWindow: InfoWindow(
                title: e.name,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => StudyRoomGroupScaffold(e),
                    ),
                  );
                },
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
              markerId: MarkerId(e.id.toString()),
              position: LatLng(e.coordinate!.latitude, e.coordinate!.longitude),
              //icon: BitmapDescriptor.defaultMarkerWithHue(208),
              infoWindow: InfoWindow(
                title: e.name,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StudyRoomGroupScaffold(e),
                  ),
                ),
              ),
            ),
          )
          .toSet();
    } else {
      return {};
    }
  }
}
