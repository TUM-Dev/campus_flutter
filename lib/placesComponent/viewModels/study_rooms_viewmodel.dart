import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/providers/default_campus_provider.dart';
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

final studyRoomsViewModel = Provider((ref) {
  final model = StudyRoomsViewModel(
    defaultCampus: ref.read(defaultCampusProvider),
  );
  ref.listen(
    defaultCampusProvider,
    (_, campus) => model.updateDefaultCampus(campus),
  );
  return model;
});

class StudyRoomsViewModel {
  Campus? _defaultCampus;
  int _widgetRequest = 0;

  StudyRoomsViewModel({Campus? defaultCampus}) : _defaultCampus = defaultCampus;

  BehaviorSubject<Map<Campus, List<StudyRoomGroup>>?> campusStudyRooms =
      BehaviorSubject.seeded(null);
  BehaviorSubject<Map<StudyRoomGroup, List<StudyRoom>>?> studyRooms =
      BehaviorSubject.seeded(null);
  BehaviorSubject<StudyRoomGroup?> widgetStudyRoom = BehaviorSubject.seeded(
    null,
  );

  int? get _savedStudyRoomId =>
      getIt<UserPreferencesService>().load(UserPreference.studyRoom) as int?;

  void updateDefaultCampus(Campus? campus) {
    _defaultCampus = campus;
    final groups = studyRoomData?.groups ?? const <StudyRoomGroup>[];
    if (_widgetRequest > 0 && !groups.any((g) => g.id == _savedStudyRoomId)) {
      fetchWidgetStudyRooms(false);
    }
  }

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
    bool forcedRefresh, [
    BuildContext? context,
  ]) async {
    final request = ++_widgetRequest;
    widgetStudyRoomLoaded = false;
    widgetStudyRoom.add(null);
    try {
      final response = await StudyRoomsService.fetchStudyRooms(forcedRefresh);
      if (request != _widgetRequest) return;
      lastFetched = response.$1;
      studyRoomData = response.$2;
      _categorizeAndSort();
      final groups = response.$2.groups ?? <StudyRoomGroup>[];
      final group = await _resolveWidgetStudyRoom(groups);
      if (request != _widgetRequest) return;
      widgetStudyRoomLoaded = true;
      widgetStudyRoom.add(group);
    } catch (error, stack) {
      if (request == _widgetRequest) widgetStudyRoom.addError(error, stack);
    }
  }

  Future<StudyRoomGroup?> _resolveWidgetStudyRoom(
    List<StudyRoomGroup> groups,
  ) async {
    if (groups.isEmpty) return null;
    final savedId = _savedStudyRoomId;
    final selected = groups.firstWhereOrNull((group) => group.id == savedId);
    if (selected != null) return selected;

    final campus = _defaultCampus;
    if (campus != null) {
      final preferredId = campus.defaultStudyRoomGroupId;
      final preferred = groups.firstWhereOrNull(
        (group) => group.id == preferredId,
      );
      if (preferred != null) return preferred;
      final nearby = groups
          .where((g) => _distanceToStudyRoom(campus.location, g) <= 5000)
          .toList();
      return nearby.isEmpty
          ? null
          : _getClosestStudyRoom(campus.location, nearby);
    }

    final position = await LocationService.getLastKnown();
    return _getClosestStudyRoom(
      position == null ? null : LatLng(position.latitude, position.longitude),
      groups,
    );
  }

  StudyRoomGroup _getClosestStudyRoom(
    LatLng? position,
    List<StudyRoomGroup> groups,
  ) {
    if (position == null) {
      return groups.firstWhereOrNull((group) => group.id == 97) ?? groups.first;
    }
    return groups.reduce(
      (a, b) =>
          _distanceToStudyRoom(position, a) <= _distanceToStudyRoom(position, b)
          ? a
          : b,
    );
  }

  double _distanceToStudyRoom(LatLng position, StudyRoomGroup group) =>
      group.coordinate == null
      ? double.infinity
      : Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          group.coordinate!.latitude,
          group.coordinate!.longitude,
        );

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
        final preferredId = campus.defaultStudyRoomGroupId;
        List<StudyRoomGroup> groups = studyRoomData!.groups!;
        groups = groups.where((element) {
          if (preferredId != null && element.id == preferredId) return true;
          if (element.coordinate != null) {
            return Geolocator.distanceBetween(
                  campus.location.latitude,
                  campus.location.longitude,
                  element.coordinate!.latitude,
                  element.coordinate!.longitude,
                ) <=
                1500;
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
    final savedId = _savedStudyRoomId;
    final groups = studyRooms.value?.keys.toList() ?? const <StudyRoomGroup>[];
    return groups.map((group) {
      return ListTile(
        dense: true,
        title: Text(group.name),
        trailing: savedId == group.id ? const Icon(Icons.check) : null,
        onTap: () {
          setWidgetStudyRoom(group.id);
          context.pop();
        },
      );
    }).toList()..insert(
      0,
      ListTile(
        dense: true,
        title: Text(
          context.tr(_defaultCampus == null ? "closest" : "useDefaultCampus"),
        ),
        trailing: !groups.any((g) => g.id == savedId)
            ? const Icon(Icons.check)
            : null,
        onTap: () {
          getIt<UserPreferencesService>().reset(UserPreference.studyRoom);
          fetchWidgetStudyRooms(false);
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
