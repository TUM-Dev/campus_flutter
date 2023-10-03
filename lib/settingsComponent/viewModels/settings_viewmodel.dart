import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_launcher/map_launcher.dart';

class SettingsViewModel {
  final Ref ref;

  SettingsViewModel(this.ref);

  List<PopupMenuEntry<AvailableMap>> getInstalledMapTypes(
      BuildContext context) {
    final availableMaps = getIt.get<List<AvailableMap>>();
    return availableMaps.map((e) {
      if (ref.read(selectedMapsApp) == e) {
        return CheckedPopupMenuItem(
          checked: true,
          value: e,
          child: Text(e.mapName),
        );
      } else {
        return CheckedPopupMenuItem(
          checked: false,
          value: e,
          child: Text(e.mapName),
        );
      }
    }).toList();
  }
}
