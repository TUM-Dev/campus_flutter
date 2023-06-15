import 'dart:async';
import 'dart:convert';

import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/services/locationService.dart';
import 'package:campus_flutter/departuresComponent/model/departure.dart';
import 'package:campus_flutter/departuresComponent/model/departuresPreference.dart';
import 'package:campus_flutter/departuresComponent/model/station.dart';
import 'package:campus_flutter/departuresComponent/services/departuresService.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class DeparturesViewModel {
  BehaviorSubject<List<Departure>?> departures = BehaviorSubject.seeded(null);
  BehaviorSubject<Campus?> closestCampus = BehaviorSubject.seeded(null);
  BehaviorSubject<int?> walkingDistance = BehaviorSubject.seeded(null);
  BehaviorSubject<Station?> selectedStation = BehaviorSubject.seeded(null);

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
            location.longitude
        );

        final nextDistance = Geolocator.distanceBetween(
            nextCampus.location.latitude,
            nextCampus.location.longitude,
            location.latitude,
            location.longitude
        );

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
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      final data = sharedPreferences.get("departuresPreferences") as String?;
      if (data != null) {
        final decoded = jsonDecode(data);
        final preferences = DeparturesPreference.fromJson(decoded);
        final station = preferences.preferences[closestCampus.value];
        if (station != null) {
          setSelectedStation(station);
          return;
        }
      }
    }

    setSelectedStation(closestCampus.value?.defaultStation);
  }

  void fetchDepartures() {
    if (closestCampus.value != null) {
      // TODO: calculate walking distance - feasible in Flutter?
      makeRequest();
    }
  }

  void makeRequest() async {
    if (closestCampus.value != null) {
      if (selectedStation.value != null) {
        final response = await DeparturesService.fetchDepartures(
            selectedStation.value!.apiName,
            walkingDistance.value,
            true
        );
        sortDepartures(response.departures);
      } else {
        final response = await DeparturesService.fetchDepartures(
            closestCampus.value!.defaultStation.apiName,
            walkingDistance.value,
            true
        );
        sortDepartures(response.departures);
      }
    }
  }

  void sortDepartures(List<Departure> departures) {
    departures.sort((departure1, departure2) {
      if (departure1.realDateTime != null && departure2.realDateTime != null) {
        if (departure1.realDateTime!.hour != departure2.realDateTime!.hour) {
          return departure1.realDateTime!.hour.compareTo(departure2.realDateTime!.hour);
        } else {
          return departure1.realDateTime!.minute.compareTo(departure2.realDateTime!.minute);
        }
      } else if (departure1.realDateTime != null) {
        if (departure1.realDateTime!.hour != departure2.dateTime.hour) {
          return departure1.realDateTime!.hour.compareTo(departure2.dateTime.hour);
        } else {
          return departure1.realDateTime!.minute.compareTo(departure2.dateTime.minute);
        }
      } else if (departure2.realDateTime != null) {
        if (departure1.dateTime.hour != departure2.dateTime.hour) {
          return departure1.dateTime.hour.compareTo(departure2.realDateTime!.hour);
        } else {
          return departure1.dateTime.minute.compareTo(departure2.realDateTime!.minute);
        }
      } else {
        if (departure1.dateTime.hour != departure2.dateTime.hour) {
          return departure1.dateTime.hour.compareTo(departure2.dateTime.hour);
        } else {
          return departure1.dateTime.minute.compareTo(departure2.dateTime.minute);
        }
      }
    });

    this.departures.add(departures);
    setTimerForRefetch();
  }

  setTimerForRefetch() {
    if ((departures.value?.length ?? 0) > 0) {
      if (departures.value![0].countdown > 0) {
        timer = Timer(Duration(minutes: departures.value![0].countdown), fetchDepartures);
        return;
      }
    }

    timer = Timer(const Duration(minutes: 1), fetchDepartures);
  }

  void updatePreference() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (selectedStation.value != null && closestCampus.value != null) {
      final data = sharedPreferences.get("departuresPreferences") as String?;
      if (data != null) {
        final decodedData = jsonDecode(data);
        DeparturesPreference preferences = DeparturesPreference.fromJson(decodedData);
        preferences.preferences[closestCampus.value!] = selectedStation.value!;
        final json = jsonEncode(preferences.toJson());
        sharedPreferences.setString("departuresPreferences", json);
      } else {
        final DeparturesPreference preferences = DeparturesPreference(
            preferences: {closestCampus.value!: selectedStation.value!}
        );
        final json = jsonEncode(preferences.toJson());
        sharedPreferences.setString("departuresPreferences", json);
      }
    }
  }
  
  List<PopupMenuEntry<Station>> getMenuEntries() {
    if (closestCampus.value != null) {
      return closestCampus.value!.allStations.map((e) => PopupMenuItem(value: e, child: Text(e.name))).toList();
    } else {
      return [];
    }
  }

  /// code from iOS application for walking distance
  /*
  func calculateWalkingDistance(completion: @escaping (_ success: Bool) -> Void) {
  if let currentLocation = locationManager.location?.coordinate, let selectedStation {
  let request = MKDirections.Request()
  request.source = MKMapItem(placemark: MKPlacemark(coordinate: currentLocation))
  request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: selectedStation.latitude, longitude: selectedStation.longitude)))
  request.transportType = .walking
  let directions = MKDirections(request: request)
  directions.calculateETA { (response, error) -> Void in
  guard let response = response else {
  completion(self.walkingDistance != nil)
  return
  }

  self.walkingDistance = (Int(response.expectedTravelTime) / 60) % 60
  completion(self.walkingDistance != nil)
  }
  } else {
  print("Weird")
  }
  }*/
}