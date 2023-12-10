import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_details.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_roomfinder_map.dart';
import 'package:campus_flutter/navigaTumComponent/services/navigatum_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

class NavigaTumDetailsViewModel {
  BehaviorSubject<NavigaTumNavigationDetails?> details =
      BehaviorSubject.seeded(null);

  final String id;
  final Ref ref;

  NavigaTumDetailsViewModel(this.id, this.ref);

  Future fetchDetails(bool forcedRefresh) async {
    if (id.isEmpty) {
      details.addError("Unable to fetch room details");
      return;
    }

    return NavigaTumService.details(forcedRefresh, id, ref).then(
      (value) => details.add(value),
      onError: (error) => details.addError(error),
    );
  }

  List<NavigaTumRoomFinderMap> getMaps() {
    return details.value?.maps.roomfinder?.available.toList() ?? [];
  }

  IconData icon(String name) {
    switch (name) {
      case "Roomcode":
      case "Raumkennung":
        return Icons.qr_code_scanner;
      case "Architect's name":
      case "Architekten-Name":
      case "Gebäudekennung":
      case "Buildingcode":
        return Icons.account_balance;
      case "Address":
      case "Adresse":
        return Icons.location_pin;
      case "Stockwerk":
      case "Floor":
        return Icons.stairs;
      case "Sitzplätze":
      case "Seats":
        return Icons.person_2;
      case "Anzahl Räume":
      case "Number of rooms":
        return Icons.door_back_door_outlined;
      case "Anzahl Gebäude":
      case "Number of buildings":
        return Icons.domain;
      default:
        return Icons.question_mark;
    }
  }
}
