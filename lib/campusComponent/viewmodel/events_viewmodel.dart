import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:campus_flutter/campusComponent/model/campus_event.dart';
import 'package:campus_flutter/campusComponent/service/campus_event_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rxdart/rxdart.dart';

final eventsViewModel = Provider((ref) => EventsViewModel());

const _campuses = <String, (String, String)>{
  'heilbronn': ('Campus Heilbronn', 'https://hn.fs.tum.de/events/'),
};

class EventsViewModel {
  static const _defaultCampusIndex = 0;

  final BehaviorSubject<List<CampusEvent>?> events = BehaviorSubject.seeded(
    null,
  );
  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);
  final BehaviorSubject<int> selectedCampus;

  String _languageCode = 'en';

  EventsViewModel()
    : selectedCampus = BehaviorSubject.seeded(
        _readSavedCampus() ?? _defaultCampusIndex,
      );

  static int? _readSavedCampus() {
    if (!getIt.isRegistered<UserPreferencesService>()) return null;
    try {
      return getIt<UserPreferencesService>().load(UserPreference.eventsCampus)
          as int?;
    } catch (error) {
      debugPrint('Could not read the events campus preference: $error');
      return null;
    }
  }

  String get campusName => _campuses.values.elementAt(selectedCampus.value).$1;
  String get campusWebsite =>
      _campuses.values.elementAt(selectedCampus.value).$2;

  /// Pass null to clear the saved campus and use the default.
  void setCampus(int? index) {
    selectedCampus.add(index ?? _defaultCampusIndex);
    try {
      if (getIt.isRegistered<UserPreferencesService>()) {
        final preferences = getIt<UserPreferencesService>();
        if (index == null) {
          preferences.reset(UserPreference.eventsCampus);
        } else {
          preferences.save(UserPreference.eventsCampus, index);
        }
      }
    } catch (error) {
      debugPrint('Could not update the events campus preference: $error');
    }
    fetch(true);
  }

  Future<void> fetch(bool forcedRefresh, {String? languageCode}) async {
    if (languageCode != null) _languageCode = languageCode;
    return CampusEventService.fetchEvents(_languageCode).then(
      (response) {
        lastFetched.add(response.$1);
        events.add(response.$2);
      },
      onError: (Object error, StackTrace stack) =>
          events.addError(error, stack),
    );
  }

  List<ListTile> getCampusEntries(BuildContext context) {
    final saved = _readSavedCampus();
    return [
      ListTile(
        dense: true,
        title: Text(context.tr('closest')),
        trailing: saved == null ? const Icon(Icons.check) : null,
        onTap: () {
          setCampus(null);
          context.pop();
        },
      ),
      for (int i = 0; i < _campuses.length; i++)
        ListTile(
          dense: true,
          title: Text(_campuses.values.elementAt(i).$1),
          trailing: saved == i ? const Icon(Icons.check) : null,
          onTap: () {
            setCampus(i);
            context.pop();
          },
        ),
    ];
  }
}
