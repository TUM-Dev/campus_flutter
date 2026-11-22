import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:campus_flutter/campusComponent/model/campus_event.dart';
import 'package:campus_flutter/campusComponent/service/campus_event_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:material_ui/material_ui.dart';

final eventsViewModel = Provider((ref) => EventsViewModel());

const campusHeilbronnName = 'Campus Heilbronn';
const campusHeilbronnUrl = 'https://hn.fs.tum.de/events/';

/// Campuses that currently have an events source.
const _eventsCampuses = [Campus.heilbronn];

class EventsViewModel {
  final BehaviorSubject<List<CampusEvent>?> events = BehaviorSubject.seeded(
    null,
  );
    final BehaviorSubject<Campus?> selectedCampus =
      BehaviorSubject.seeded(null);

  String _languageCode = 'en';

  EventsViewModel() {
    _findCampus(false);
  }

  Future<void> _findCampus(bool fetchClosest) async {
    int? preferenceId;
    try {
      preferenceId =
          getIt<UserPreferencesService>().load(UserPreference.eventsCampus)
              as int?;
    } catch (_) {}
    if (preferenceId != null &&
        !fetchClosest &&
        preferenceId < _eventsCampuses.length) {
      selectedCampus.add(_eventsCampuses[preferenceId]);
    } else {
      final location = await LocationService.getLastKnown();
      if (location != null) {
        final closest = _eventsCampuses.reduce((a, b) {
          final distA = Geolocator.distanceBetween(
            a.location.latitude,
            a.location.longitude,
            location.latitude,
            location.longitude,
          );
          final distB = Geolocator.distanceBetween(
            b.location.latitude,
            b.location.longitude,
            location.latitude,
            location.longitude,
          );
          return distA < distB ? a : b;
        });
        selectedCampus.add(closest);
      } else {
        selectedCampus.add(_eventsCampuses.first);
      }
    }
  }

    void _setSelectedCampus(Campus campus) {
    selectedCampus.add(campus);
    try {
      getIt<UserPreferencesService>().save(
        UserPreference.eventsCampus,
        _eventsCampuses.indexOf(campus),
      );
    } catch (_) {}
  }

  List<ListTile> getCampusEntries(BuildContext context) {
    int? savedPref;
    try {
      savedPref =
          getIt<UserPreferencesService>().load(UserPreference.eventsCampus)
              as int?;
    } catch (_) {}
    return _eventsCampuses.map((campus) {
      final isSelected = selectedCampus.value == campus && savedPref != null;
      return ListTile(
        dense: true,
        title: Text(campus.name),
        trailing: isSelected ? const Icon(Icons.check) : null,
        onTap: () {
          _setSelectedCampus(campus);
          context.pop();
        },
      );
    }).toList()
      ..insert(
        0,
        ListTile(
          dense: true,
          title: Text(context.tr('closest')),
          trailing: savedPref == null ? const Icon(Icons.check) : null,
          onTap: () {
                    try {
              getIt<UserPreferencesService>().reset(
                UserPreference.eventsCampus,
              );
            } catch (_) {}
            _findCampus(true);
            context.pop();
          },
        ),
      );
  }

      Future<void> fetch(bool forcedRefresh, {String? languageCode}) async {
    if (languageCode != null) _languageCode = languageCode;
    return CampusEventService.fetchEvents(_languageCode).then(
      (response) => events.add(response),
      onError: (Object error, StackTrace stack) =>
          events.addError(error, stack),
    );
  }
}
