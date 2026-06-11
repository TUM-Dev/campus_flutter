import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/campusComponent/model/heilbronn_event.dart';
import 'package:campus_flutter/campusComponent/service/heilbronn_event_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

final heilbronnEventsViewModel = Provider(
  (ref) => HeilbronnEventsViewModel(),
);

class HeilbronnEventsViewModel {
  static const _heilbronnLatitude = 49.1472;
  static const _heilbronnLongitude = 9.2165;
  static const _heilbronnRadiusMeters = 100000.0;

  final BehaviorSubject<List<HeilbronnEvent>?> events =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<bool?> isNearHeilbronn = BehaviorSubject.seeded(null);

  Future<void> fetch() async {
    final position = await LocationService.getLastKnown().onError(
      (error, stackTrace) => null,
    );
    if (position == null ||
        !_isWithinRadius(position.latitude, position.longitude)) {
      isNearHeilbronn.add(false);
      events.add([]);
      return;
    }

    isNearHeilbronn.add(true);
    try {
      final fetchedEvents = await HeilbronnEventService.fetchEvents();
      fetchedEvents.removeWhere((event) {
        final eventDate = event.eventDate;
        return eventDate != null && eventDate.isBefore(_today());
      });
      events.add(fetchedEvents);
    } catch (error) {
      events.addError(error);
    }
  }

  bool _isWithinRadius(double latitude, double longitude) {
    return Geolocator.distanceBetween(
          latitude,
          longitude,
          _heilbronnLatitude,
          _heilbronnLongitude,
        ) <=
        _heilbronnRadiusMeters;
  }

  DateTime _today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}
