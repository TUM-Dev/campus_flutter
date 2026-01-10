import 'package:campus_flutter/base/enums/campus.dart';

import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/placesComponent/model/maps/marker.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_data.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/study_rooms_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final placesViewModel = Provider((ref) => PlacesViewModel(ref));

class PlacesViewModel {
  List<Campus> campuses = [];

  StudyRoomData? studyRoomData;
  final Ref ref;

  PlacesViewModel(this.ref);

  Future fetch(bool forcedRefresh) {
    return _getCampusByLocation().then((value) {
      campuses = value;
    });
  }

  Future<List<Campus>> _getCampusByLocation() {
    List<Campus> defaultOrder = [
      Campus.stammgelaende,
      Campus.garching,
      Campus.olympiapark,
      Campus.freising,
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
            campus1Location.longitude,
          );
          final distance2 = Geolocator.distanceBetween(
            location.latitude,
            location.longitude,
            campus2Location.latitude,
            campus2Location.longitude,
          );
          return distance1.compareTo(distance2);
        });
        return defaultOrder;
      }
    }, onError: (error) => defaultOrder);
  }

  Set<Marker> getCampusMarkers(BuildContext context, Campus campus) {
    final studyRoomMarkers = ref
        .read(studyRoomsViewModel)
        .mapMakersCampus(context, campus);
    final cafeteriaMarkers = ref
        .read(cafeteriasViewModel)
        .mapMakersCampus(context, campus);
    return studyRoomMarkers.union(cafeteriaMarkers);
  }
}
