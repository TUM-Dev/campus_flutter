import 'dart:math';

import 'package:campus_flutter/base/services/locationService.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/studyRoom.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/studyRoomGroup.dart';
import 'package:campus_flutter/placesComponent/services/studyrooms_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class StudyRoomWidgetViewModel {
  BehaviorSubject<StudyRoomGroup?> studyRoomGroup = BehaviorSubject.seeded(null);
  BehaviorSubject<List<StudyRoom>?> rooms = BehaviorSubject.seeded(null);

  void getClosestRooms() async {
    final response = await StudyRoomsService.fetchStudyRooms();
    final location = await LocationService.getLastKnown();

    if (response.groups != null && response.rooms != null && location != null) {
      final group = response.groups?.reduce((currentGroup, nextGroup) {
        final distanceCurrent = currentGroup.coordinate != null
            ? Geolocator.distanceBetween(currentGroup.coordinate!.latitude, currentGroup.coordinate!.longitude, location.latitude, location.longitude)
            : 0.0;

        final distanceNext = nextGroup.coordinate != null
            ? Geolocator.distanceBetween(nextGroup.coordinate!.latitude, nextGroup.coordinate!.longitude, location.latitude, location.longitude)
            : 0.0;

        if (distanceCurrent < distanceNext) {
          return currentGroup;
        } else {
          return nextGroup;
        }
      });

      studyRoomGroup.add(group);
      rooms.add(group?.getRooms(response.rooms!));
    } else {
      return;
    }
  }
}
