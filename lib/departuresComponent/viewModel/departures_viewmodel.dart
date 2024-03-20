import 'dart:async';
import 'dart:convert';

import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/departuresComponent/model/departure.dart';
import 'package:campus_flutter/departuresComponent/model/departures_preference.dart';
import 'package:campus_flutter/departuresComponent/model/mvv_response.dart';
import 'package:campus_flutter/departuresComponent/model/station.dart';
import 'package:campus_flutter/departuresComponent/services/departures_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/settingsComponent/service/user_preferences_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

final departureViewModel = Provider((ref) => DeparturesViewModel());

class DeparturesViewModel {
  final BehaviorSubject<List<Departure>?> departures = BehaviorSubject.seeded(
    null,
  );
  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);
  final BehaviorSubject<Campus?> widgetCampus = BehaviorSubject.seeded(null);
  final BehaviorSubject<int?> walkingDistance = BehaviorSubject.seeded(null);
  final BehaviorSubject<Station?> selectedStation =
      BehaviorSubject.seeded(null);

  Timer? timer;

  setWidgetCampus(Campus campus) {
    widgetCampus.add(campus);
    timer?.cancel();
    assignSelectedStation();
    getIt<UserPreferencesService>()
        .save(UserPreference.departure, campus.index);
  }

  setSelectedStation(Station? station) {
    selectedStation.add(station);
    timer?.cancel();
    fetchDepartures();
    updatePreference();
  }

  DeparturesViewModel() {
    findWidgetCampus(false);
  }

  void findWidgetCampus(bool fetchClosest) async {
    final preferenceId = getIt<UserPreferencesService>().load(
      UserPreference.departure,
    );

    if (preferenceId != null && !fetchClosest) {
      widgetCampus.add(Campus.values[preferenceId as int]);
      assignSelectedStation();
    } else {
      LocationService.getLastKnown().then(
        (location) {
          if (location != null) {
            final closestCampus =
                Campus.values.reduce((currentCampus, nextCampus) {
              final currentDistance = Geolocator.distanceBetween(
                currentCampus.location.latitude,
                currentCampus.location.longitude,
                location.latitude,
                location.longitude,
              );

              final nextDistance = Geolocator.distanceBetween(
                nextCampus.location.latitude,
                nextCampus.location.longitude,
                location.latitude,
                location.longitude,
              );

              return currentDistance < nextDistance
                  ? currentCampus
                  : nextCampus;
            });

            widgetCampus.add(closestCampus);
            assignSelectedStation();
          }
        },
        onError: (error) {
          widgetCampus.add(Campus.garching);
          assignSelectedStation();
        },
      );
    }
  }

  Future<void> assignSelectedStation() async {
    if (widgetCampus.value != null) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final data = sharedPreferences.get("departuresPreferences") as String?;
      if (data != null) {
        final decoded = jsonDecode(data);
        try {
          final preferences = DeparturesPreference.fromJson(decoded);
          final station = preferences.preferences[widgetCampus.value];
          if (station != null) {
            setSelectedStation(station);
            return;
          }
        } catch (error) {
          setSelectedStation(widgetCampus.value?.defaultStation);
        }
      }
    }

    setSelectedStation(widgetCampus.value?.defaultStation);
  }

  void fetchDepartures() {
    if (widgetCampus.value != null) {
      // TODO: calculate walking distance - feasible in Flutter?
      fetch(true);
    }
  }

  Future fetch(bool forcedRefresh) async {
    if (widgetCampus.value != null) {
      if (selectedStation.value != null) {
        DeparturesService.fetchDepartures(
          true,
          selectedStation.value!.apiName,
          walkingDistance.value,
        ).then(
          (response) => sortDepartures(response),
          onError: (error) => departures.addError(error),
        );
      } else {
        DeparturesService.fetchDepartures(
          true,
          widgetCampus.value!.defaultStation.apiName,
          walkingDistance.value,
        ).then(
          (response) => sortDepartures(response),
          onError: (error) => departures.addError(error),
        );
      }
    }
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

  setTimerForRefresh() {
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

  void updatePreference() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    if (selectedStation.value != null && widgetCampus.value != null) {
      final data = sharedPreferences.get("departuresPreferences") as String?;
      if (data != null) {
        final decodedData = jsonDecode(data);
        try {
          DeparturesPreference preferences =
              DeparturesPreference.fromJson(decodedData);
          preferences.preferences[widgetCampus.value!] = selectedStation.value!;
          final json = jsonEncode(preferences.toJson());
          sharedPreferences.setString("departuresPreferences", json);
        } catch (_) {
          final DeparturesPreference preferences = DeparturesPreference(
            preferences: {widgetCampus.value!: selectedStation.value!},
          );
          final json = jsonEncode(preferences.toJson());
          sharedPreferences.setString("departuresPreferences", json);
        }
      } else {
        final DeparturesPreference preferences = DeparturesPreference(
          preferences: {widgetCampus.value!: selectedStation.value!},
        );
        final json = jsonEncode(preferences.toJson());
        sharedPreferences.setString("departuresPreferences", json);
      }
    }
  }

  List<PopupMenuEntry<Station>> getStationEntries() {
    if (widgetCampus.value != null) {
      return widgetCampus.value!.allStations
          .map(
            (e) => PopupMenuItem(
              value: e,
              child: selectedStation.value?.name == e.name
                  ? IconText(
                      iconData: Icons.check,
                      label: e.name,
                      leadingIcon: false,
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
    return Campus.values.map((e) {
      final isSelected = widgetCampus.value == e &&
          getIt<UserPreferencesService>().load(
                UserPreference.departure,
              ) !=
              null;
      return ListTile(
        dense: true,
        title: Text(e.name),
        trailing: isSelected ? const Icon(Icons.check) : null,
        onTap: () {
          setWidgetCampus(e);
          context.pop();
        },
      );
    }).toList()
      ..insert(
        0,
        ListTile(
          dense: true,
          title: Text(context.localizations.closest),
          trailing: getIt<UserPreferencesService>().load(
                    UserPreference.departure,
                  ) ==
                  null
              ? const Icon(Icons.check)
              : null,
          onTap: () {
            getIt<UserPreferencesService>().reset(UserPreference.departure);
            findWidgetCampus(true);
            context.pop();
          },
        ),
      );
  }
}
