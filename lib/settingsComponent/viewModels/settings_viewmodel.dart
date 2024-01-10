import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/settingsComponent/views/default_maps_picker_view.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_launcher/map_launcher.dart';

final settingsViewModel = Provider((ref) => SettingsViewModel(ref));

class SettingsViewModel {
  final Ref ref;

  SettingsViewModel(this.ref);

  List<PopupMenuEntry<AvailableMap>> getInstalledMapTypes(
    BuildContext context,
  ) {
    final availableMaps = getIt.get<List<AvailableMap>>();
    return availableMaps.mapIndexed((index, e) {
      if (ref.read(selectedMapsApp)?.mapType == e.mapType ||
          (ref.read(selectedMapsApp) == null && index == 0)) {
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
