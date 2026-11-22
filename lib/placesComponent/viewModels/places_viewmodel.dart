import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/providers/default_campus_provider.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/base/util/map_launcher.dart';
import 'package:campus_flutter/placesComponent/model/maps/marker.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/study_rooms_viewmodel.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:rxdart/rxdart.dart';

final placesViewModel = Provider((ref) {
  final model = PlacesViewModel(
    ref,
    defaultCampus: ref.read(defaultCampusProvider),
  );
  ref.listen(
    defaultCampusProvider,
    (_, campus) => model.updateDefaultCampus(campus),
  );
  return model;
});

class PlacesViewModel {
  static const List<Campus> _defaultOrder = [
    Campus.stammgelaende,
    Campus.garching,
    Campus.freising,
    Campus.olympiapark,
    Campus.klinikumRechts,
    Campus.grosshadern,
    Campus.ottobrunn,
    Campus.heilbronn,
  ];

  final Ref ref;
  Campus? _defaultCampus;
  Position? _lastLocation;

  final BehaviorSubject<List<Campus>> campuses = BehaviorSubject.seeded(
    _defaultOrder,
  );

  PlacesViewModel(this.ref, {Campus? defaultCampus}) {
    _defaultCampus = defaultCampus;
    _emitOrderedCampuses();
  }

  void updateDefaultCampus(Campus? campus) {
    _defaultCampus = campus;
    _emitOrderedCampuses();
  }

  Future<void> fetch(bool forcedRefresh) async {
    try {
      _lastLocation = await LocationService.getLastKnown();
    } catch (_) {
      _lastLocation = null;
    }
    _emitOrderedCampuses();
  }

  void _emitOrderedCampuses() {
    final ordered = List<Campus>.of(_defaultOrder);
    final location = _lastLocation;
    if (location != null) {
      ordered.sort((a, b) {
        final distanceA = Geolocator.distanceBetween(
          location.latitude,
          location.longitude,
          a.location.latitude,
          a.location.longitude,
        );
        final distanceB = Geolocator.distanceBetween(
          location.latitude,
          location.longitude,
          b.location.latitude,
          b.location.longitude,
        );
        return distanceA.compareTo(distanceB);
      });
    }
    final preferred = _defaultCampus;
    if (preferred != null && ordered.remove(preferred)) {
      ordered.insert(0, preferred);
    }
    campuses.add(ordered);
  }

  Set<Marker> getCampusMarkers(BuildContext context, Campus campus) {
    final studyRoomMarkers = ref
        .read(studyRoomsViewModel)
        .mapMakersCampus(context, campus);
    final cafeteriaMarkers = ref
        .read(cafeteriasViewModel)
        .mapMakersCampus(context, campus);
    final stationMarkers = campus.allStations
        .where((station) => station.location != null)
        .map(
          (station) => Marker(
            id: 'station_${station.apiName}',
            position: LatLng(
              station.location!.latitude,
              station.location!.longitude,
            ),
            infoWindow: InfoWindow(
              title: station.name,
              onTap: () => showDirectionsDialog(
                station.name,
                station.location!,
                context,
              ),
            ),
          ),
        )
        .toSet();
    final combined = studyRoomMarkers.union(cafeteriaMarkers);
    return combined.isNotEmpty ? combined : stationMarkers;
  }
}
