import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_data.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/services/studyrooms_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class StudyRoomWidgetViewModel implements ViewModel {
  BehaviorSubject<StudyRoomGroup?> studyRoomGroup =
      BehaviorSubject.seeded(null);
  BehaviorSubject<List<StudyRoom>?> rooms = BehaviorSubject.seeded(null);
  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  @override
  Future fetch(bool forcedRefresh) async {
    StudyRoomsService.fetchStudyRooms(forcedRefresh).then((response) async {
      final location = await LocationService.getLastKnown();
      _getClosestRooms(response, location);
    }, onError: (error) {
      studyRoomGroup.addError(error);
      rooms.addError(error);
    });
  }

  _getClosestRooms((DateTime?, StudyRoomData) response, Position? location) {
    lastFetched.add(response.$1);

    if (response.$2.groups != null &&
        response.$2.rooms != null &&
        location != null) {
      final group = response.$2.groups?.reduce((currentGroup, nextGroup) {
        final distanceCurrent = currentGroup.coordinate != null
            ? Geolocator.distanceBetween(
                currentGroup.coordinate!.latitude,
                currentGroup.coordinate!.longitude,
                location.latitude,
                location.longitude)
            : 0.0;

        final distanceNext = nextGroup.coordinate != null
            ? Geolocator.distanceBetween(
                nextGroup.coordinate!.latitude,
                nextGroup.coordinate!.longitude,
                location.latitude,
                location.longitude)
            : 0.0;

        if (distanceCurrent < distanceNext) {
          return currentGroup;
        } else {
          return nextGroup;
        }
      });

      studyRoomGroup.add(group);
      final rooms = group?.getRooms(response.$2.rooms!);
      rooms?.sort((room1, room2) {
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

      this.rooms.add(rooms ?? []);
    } else {
      return;
    }
  }

  int countAvailableRooms() {
    return rooms.value?.where((element) => element.isAvailable).length ?? 0;
  }
}
