import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class PlacesViewModel implements ViewModel {
  BehaviorSubject<bool?> status = BehaviorSubject.seeded(null);
  List<Campus> campuses = [];
  List<Cafeteria> cafeterias = [];

  StudyRoomData? studyRoomData;

  @override
  Future fetch(bool forcedRefresh) {
    return Future.wait([
      //StudyRoomsService.fetchStudyRooms(forcedRefresh),
      //CafeteriasService.fetchCafeterias(forcedRefresh),
      _getCampusByLocation()
    ]).then((value) {
      //studyRoomData = (value[0] as (DateTime?, StudyRoomData)).$2;
      //cafeterias = (value[1] as (DateTime?, List<Cafeteria>)).$2;
      campuses = value[0];
      status.add(true);
    }, onError: (error) => status.addError(error));
  }

  Future<List<Campus>> _getCampusByLocation() {
    List<Campus> defaultOrder = [
      Campus.stammgelaende,
      Campus.garching,
      Campus.olympiapark,
      Campus.klinikumRechts,
      Campus.freising
    ];
    return LocationService.getLastKnown().then((location) {
      if (location == null) {
        return defaultOrder;
      } else {
        defaultOrder.sort((campus1, campus2) {
          final campus1Location = campus1.location;
          final campus2Location = campus2.location;
          final distance1 = Geolocator.distanceBetween(
              location.latitude,
              location.longitude,
              campus1Location.latitude,
              campus1Location.longitude);
          final distance2 = Geolocator.distanceBetween(
              location.latitude,
              location.longitude,
              campus2Location.latitude,
              campus2Location.longitude);
          return distance1.compareTo(distance2);
        });
        return defaultOrder;
      }
    }, onError: (error) => defaultOrder);
  }

  /*List<Cafeteria> getCampusCafeterias(Campus campus) {
    return cafeterias
        .where((element) =>
            Geolocator.distanceBetween(
                campus.location.latitude,
                campus.location.longitude,
                element.location.latitude,
                element.location.longitude) <=
            1000)
        .toList();
  }

  List<StudyRoomGroup> getCampusStudyRooms(Campus campus) {
    if (studyRoomData?.groups != null) {
      final groups = studyRoomData!.groups!;
      return groups.where((element) {
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
      })
          //.map((e) => (e, getStudyRoom(e)))
          .toList();
    } else {
      return [];
    }
  }*/

  /*List<StudyRoom> getStudyRoom(StudyRoomGroup studyRoomGroup) {
    final rooms = studyRoomGroup.getRooms(studyRoomData?.rooms ?? []);
    rooms.sort((room1, room2) {
      if (room1.localizedStatus == "Free" && room2.localizedStatus == "Free") {
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
    return rooms;
  }

  int countFreeRooms(List<StudyRoom> studyRooms) {
    return studyRooms.where((element) => element.isAvailable).length;
  }*/
}
