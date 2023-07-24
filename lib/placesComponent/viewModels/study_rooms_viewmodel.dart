import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_data.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/services/study_rooms_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class StudyRoomsViewModel {
  BehaviorSubject<Map<Campus, List<StudyRoomGroup>>?> campusStudyRooms =
      BehaviorSubject.seeded(null);
  BehaviorSubject<Map<StudyRoomGroup, List<StudyRoom>>?> studyRooms =
      BehaviorSubject.seeded(null);
  BehaviorSubject<StudyRoomGroup?> closestStudyRoom =
      BehaviorSubject.seeded(null);

  StudyRoomData? studyRoomData;
  DateTime? lastFetched;

  Future fetch(bool forcedRefresh) async {
    return StudyRoomsService.fetchStudyRooms(forcedRefresh).then((value) {
      lastFetched = value.$1;
      studyRoomData = value.$2;
      _categorizeAndSort();
    }, onError: (error) => studyRooms.addError(error));
  }

  Future fetchClosestStudyRoom(bool forcedRefresh) async {
    return Future.wait([
      StudyRoomsService.fetchStudyRooms(forcedRefresh),
      LocationService.getLastKnown()
    ]).then((value) {
      lastFetched = (value[0] as (DateTime?, StudyRoomData)).$1;
      studyRoomData = (value[0] as (DateTime?, StudyRoomData)).$2;
      _categorizeAndSort();
      _getClosestStudyRoomGroup(value[1] as Position?);
    }, onError: (error) => closestStudyRoom.addError(error));
  }

  _getClosestStudyRoomGroup(Position? position) {
    if (position == null ||
        studyRoomData?.groups == null ||
        studyRoomData?.groups == null) {
      closestStudyRoom.addError("Could not get closest study rooms!");
    }

    final group = studyRoomData?.groups?.reduce((currentGroup, nextGroup) {
      final distanceCurrent = currentGroup.coordinate != null
          ? Geolocator.distanceBetween(
              currentGroup.coordinate!.latitude,
              currentGroup.coordinate!.longitude,
              position!.latitude,
              position.longitude)
          : 0.0;

      final distanceNext = nextGroup.coordinate != null
          ? Geolocator.distanceBetween(
              nextGroup.coordinate!.latitude,
              nextGroup.coordinate!.longitude,
              position!.latitude,
              position.longitude)
          : 0.0;

      if (distanceCurrent < distanceNext) {
        return currentGroup;
      } else {
        return nextGroup;
      }
    });

    closestStudyRoom.add(group);
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
        if (room1.localizedStatus == "Free" &&
            room2.localizedStatus == "Free") {
          return 0;
        } else if (room1.localizedStatus != "Free" &&
            room2.localizedStatus == "Free") {
          return 1;
        } else if (room1.localizedStatus == "Free" &&
            room2.localizedStatus != "Free") {
          return -1;
        } else if (room1.localizedStatus != "Unknown" &&
            room2.localizedStatus == "Unknown") {
          return -1;
        } else if (room1.localizedStatus == "Unknown" &&
            room2.localizedStatus != "Unknown") {
          return 1;
        } else {
          return 0;
        }
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
                    element.coordinate!.longitude) <=
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
    return data.where((element) => element.localizedStatus == "Free").length;
  }
}
