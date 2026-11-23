import 'dart:async';
import 'dart:convert';

import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/providers/default_campus_provider.dart';
import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/homeComponent/model/departure.dart';
import 'package:campus_flutter/homeComponent/model/departures_preference.dart';
import 'package:campus_flutter/homeComponent/model/mvv_response.dart';
import 'package:campus_flutter/homeComponent/model/station.dart';
import 'package:campus_flutter/homeComponent/service/departures_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:material_ui/material_ui.dart';

final departureViewModel = Provider((ref) {
  final model = DeparturesViewModel(
    defaultCampus: ref.read(defaultCampusProvider),
  );
  ref.listen(
    defaultCampusProvider,
    (_, campus) => model.updateDefaultCampus(campus),
  );
  ref.onDispose(model.dispose);
  return model;
});

class DeparturesViewModel {
  final BehaviorSubject<List<Departure>?> departures = BehaviorSubject.seeded(
    null,
  );
  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);
  final BehaviorSubject<Campus?> widgetCampus = BehaviorSubject.seeded(null);
  final BehaviorSubject<int?> walkingDistance = BehaviorSubject.seeded(null);
  final BehaviorSubject<Station?> selectedStation = BehaviorSubject.seeded(
    null,
  );

  static const _stationsKey = 'departuresPreferences';

  Campus? _defaultCampus;
  int _campusRequest = 0;
  int _departuresRequest = 0;
  Timer? timer;

  DeparturesViewModel({this._defaultCampus}) {
    findWidgetCampus(false);
  }

  Campus? get _savedCampus {
    final index = getIt<UserPreferencesService>().load(
      UserPreference.departure,
    );
    return index is int && index >= 0 && index < Campus.values.length
        ? Campus.values[index]
        : null;
  }

  void updateDefaultCampus(Campus? campus) {
    _defaultCampus = campus;
    if (_savedCampus == null) findWidgetCampus(false);
  }

  void setWidgetCampus(Campus campus) {
    getIt<UserPreferencesService>().save(
      UserPreference.departure,
      campus.index,
    );
    findWidgetCampus(false);
  }

  void findWidgetCampus(bool ignoreOverride) async {
    final request = ++_campusRequest;
    final campus = (ignoreOverride ? null : _savedCampus) ?? _defaultCampus;
    if (campus != null) {
      _selectCampus(campus);
      return;
    }

    final location = await LocationService.getLastKnown();
    if (request != _campusRequest) return;
    if (location == null) {
      _selectCampus(Campus.garching);
      return;
    }
    double distance(Campus campus) => Geolocator.distanceBetween(
      campus.location.latitude,
      campus.location.longitude,
      location.latitude,
      location.longitude,
    );
    _selectCampus(
      Campus.values.reduce((a, b) => distance(a) < distance(b) ? a : b),
    );
  }

  void _selectCampus(Campus campus) {
    if (campus == widgetCampus.value) return;
    widgetCampus.add(campus);
    final station =
        _readStations().preferences[campus] ?? campus.defaultStation;
    _selectStation(station);
  }

  DeparturesPreference _readStations() {
    try {
      final data = getIt<UserPreferencesService>().sharedPreferences.getString(
        _stationsKey,
      );
      if (data != null) return DeparturesPreference.fromJson(jsonDecode(data));
    } catch (_) {
      // A malformed entry falls back to the campus station.
    }
    return DeparturesPreference(preferences: {});
  }

  void setSelectedStation(Station? station) {
    final campus = widgetCampus.value;
    if (campus == null) return;
    final preferences = _readStations();
    if (station == null) {
      preferences.preferences.remove(campus);
    } else {
      preferences.preferences[campus] = station;
    }
    getIt<UserPreferencesService>().sharedPreferences.setString(
      _stationsKey,
      jsonEncode(preferences.toJson()),
    );
    _selectStation(station ?? campus.defaultStation);
  }

  void _selectStation(Station station) {
    selectedStation.add(station);
    departures.add(null);
    fetchDepartures();
  }

  void fetchDepartures() {
    fetch(true);
  }

  Future<void> fetch(bool forcedRefresh) async {
    final campus = widgetCampus.value;
    if (campus == null) return;
    final station = selectedStation.value ?? campus.defaultStation;
    final request = ++_departuresRequest;
    timer?.cancel();
    try {
      final response = await DeparturesService.fetchDepartures(
        true,
        station.apiName,
        walkingDistance.value,
        campus: campus,
      );
      if (request == _departuresRequest) sortDepartures(response);
    } catch (error, stack) {
      if (request == _departuresRequest) departures.addError(error, stack);
    }
  }

  void dispose() {
    _campusRequest++;
    _departuresRequest++;
    timer?.cancel();
  }

  void sortDepartures(({DateTime? saved, MvvResponse data}) response) {
    lastFetched.add(response.saved);

    response.data.departures.sort((departure1, departure2) {
      if (departure1.realDateTime != null && departure2.realDateTime != null) {
        return departure1.realDateTime!.compareTo(departure2.realDateTime!);
      } else if (departure1.realDateTime != null &&
          departure2.dateTime != null) {
        return departure1.realDateTime!.compareTo(departure2.dateTime!);
      } else if (departure2.realDateTime != null &&
          departure2.dateTime != null) {
        return departure1.dateTime!.compareTo(departure2.realDateTime!);
      } else if (departure1.dateTime != null && departure2.dateTime != null) {
        return departure1.dateTime!.compareTo(departure2.dateTime!);
      } else {
        return 0;
      }
    });

    departures.add(response.data.departures);
    setTimerForRefresh();
  }

  void setTimerForRefresh() {
    if ((departures.value?.length ?? 0) > 0) {
      if (departures.value![0].countdown > 0) {
        timer = Timer(
          Duration(minutes: departures.value![0].countdown),
          fetchDepartures,
        );
        return;
      }
    }

    timer = Timer(const Duration(minutes: 1), fetchDepartures);
  }

  List<PopupMenuEntry<Station>> getStationEntries() {
    if (widgetCampus.value != null) {
      return widgetCampus.value!.allStations
          .map(
            (e) => PopupMenuItem(
              value: e,
              child: selectedStation.value?.name == e.name
                  ? SymbolText.icon(
                      iconData: Icons.check,
                      label: e.name,
                      leading: false,
                    )
                  : Text(e.name),
            ),
          )
          .toList();
    } else {
      return [];
    }
  }

  List<ListTile> getCampusEntries(BuildContext context) {
    final saved = _savedCampus;
    return [
      ListTile(
        dense: true,
        title: Text(
          context.tr(_defaultCampus == null ? 'closest' : 'useDefaultCampus'),
        ),
        trailing: saved == null ? const Icon(Icons.check) : null,
        onTap: () {
          getIt<UserPreferencesService>().reset(UserPreference.departure);
          findWidgetCampus(true);
          context.pop();
        },
      ),
      for (final campus in Campus.values)
        ListTile(
          dense: true,
          title: Text(campus.name),
          trailing: campus == saved ? const Icon(Icons.check) : null,
          onTap: () {
            setWidgetCampus(campus);
            context.pop();
          },
        ),
    ];
  }
}
