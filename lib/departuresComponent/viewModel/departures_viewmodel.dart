import 'dart:async';
import 'dart:convert';

import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/departuresComponent/model/departure.dart';
import 'package:campus_flutter/departuresComponent/model/departures_preference.dart';
import 'package:campus_flutter/departuresComponent/model/mvv_response.dart';
import 'package:campus_flutter/departuresComponent/model/station.dart';
import 'package:campus_flutter/departuresComponent/services/departures_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class DeparturesViewModel extends ViewModel {
  BehaviorSubject<List<Departure>?> departures = BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  final BehaviorSubject<Campus?> closestCampus = BehaviorSubject.seeded(null);
  final BehaviorSubject<int?> walkingDistance = BehaviorSubject.seeded(null);
  final BehaviorSubject<Station?> selectedStation =
      BehaviorSubject.seeded(null);

  Timer? timer;

  setSelectedStation(Station? station) {
    selectedStation.add(station);
    timer?.cancel();
    fetchDepartures();
    updatePreference();
  }

  DeparturesViewModel() {
    calculateClosestCampus();
  }

  void calculateClosestCampus() async {
    final location = await LocationService.getLastKnown();

    if (location != null) {
      final closestCampus = Campus.values.reduce((currentCampus, nextCampus) {
        final currentDistance = Geolocator.distanceBetween(
            currentCampus.location.latitude,
            currentCampus.location.longitude,
            location.latitude,
            location.longitude);

        final nextDistance = Geolocator.distanceBetween(
            nextCampus.location.latitude,
            nextCampus.location.longitude,
            location.latitude,
            location.longitude);

        return currentDistance < nextDistance ? currentCampus : nextCampus;
      });

      this.closestCampus.add(closestCampus);
      assignSelectedStation();
    } else {
      // TODO:
      return;
    }
  }

  Future<void> assignSelectedStation() async {
    if (closestCampus.value != null) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final data = sharedPreferences.get("departuresPreferences") as String?;
      if (data != null) {
        final decoded = jsonDecode(data);
        try {
          final preferences = DeparturesPreference.fromJson(decoded);
          final station = preferences.preferences[closestCampus.value];
          if (station != null) {
            setSelectedStation(station);
            return;
          }
        } catch (error) {
          setSelectedStation(closestCampus.value?.defaultStation);
        }
      }
    }

    setSelectedStation(closestCampus.value?.defaultStation);
  }

  void fetchDepartures() {
    if (closestCampus.value != null) {
      // TODO: calculate walking distance - feasible in Flutter?
      fetch(true);
    }
  }

  @override
  Future fetch(bool forcedRefresh) async {
    if (closestCampus.value != null) {
      if (selectedStation.value != null) {
        DeparturesService.fetchDepartures(
                true, selectedStation.value!.apiName, walkingDistance.value)
            .then((response) => sortDepartures(response),
                onError: (error) => departures.addError(error));
      } else {
        DeparturesService.fetchDepartures(
                true,
                closestCampus.value!.defaultStation.apiName,
                walkingDistance.value)
            .then((response) => sortDepartures(response),
                onError: (error) => departures.addError(error));
      }
    }
  }

  void sortDepartures(({DateTime? saved, MvvResponse data}) response) {
    lastFetched.add(response.saved);

    response.data.departures.sort((departure1, departure2) {
      if (departure1.realDateTime != null && departure2.realDateTime != null) {
        return departure1.realDateTime!.compareTo(departure2.realDateTime!);
      } else if (departure1.realDateTime != null) {
        return departure1.realDateTime!.compareTo(departure2.dateTime);
      } else if (departure2.realDateTime != null) {
        return departure1.dateTime.compareTo(departure2.realDateTime!);
      } else {
        return departure1.dateTime.compareTo(departure2.dateTime);
      }
    });

    departures.add(response.data.departures);
    setTimerForRefresh();
  }

  setTimerForRefresh() {
    if ((departures.value?.length ?? 0) > 0) {
      if (departures.value![0].countdown > 0) {
        timer = Timer(
            Duration(minutes: departures.value![0].countdown), fetchDepartures);
        return;
      }
    }

    timer = Timer(const Duration(minutes: 1), fetchDepartures);
  }

  void updatePreference() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    if (selectedStation.value != null && closestCampus.value != null) {
      final data = sharedPreferences.get("departuresPreferences") as String?;
      if (data != null) {
        final decodedData = jsonDecode(data);
        try {
          DeparturesPreference preferences =
              DeparturesPreference.fromJson(decodedData);
          preferences.preferences[closestCampus.value!] =
              selectedStation.value!;
          final json = jsonEncode(preferences.toJson());
          sharedPreferences.setString("departuresPreferences", json);
        } catch (_) {
          final DeparturesPreference preferences = DeparturesPreference(
              preferences: {closestCampus.value!: selectedStation.value!});
          final json = jsonEncode(preferences.toJson());
          sharedPreferences.setString("departuresPreferences", json);
        }
      } else {
        final DeparturesPreference preferences = DeparturesPreference(
            preferences: {closestCampus.value!: selectedStation.value!});
        final json = jsonEncode(preferences.toJson());
        sharedPreferences.setString("departuresPreferences", json);
      }
    }
  }

  List<PopupMenuEntry<Station>> getMenuEntries() {
    if (closestCampus.value != null) {
      return closestCampus.value!.allStations
          .map((e) => PopupMenuItem(
              value: e,
              child: selectedStation.value?.name == e.name
                  ? IconText(
                      iconData: Icons.check, label: e.name, leadingIcon: false)
                  : Text(e.name)))
          .toList();
    } else {
      return [];
    }
  }
}
