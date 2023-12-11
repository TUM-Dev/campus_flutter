import 'package:campus_flutter/base/classes/location.dart';
import 'package:campus_flutter/settingsComponent/views/default_maps_picker_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_launcher/map_launcher.dart';

void launchDirections(Location location, String name, WidgetRef ref) async {
  if (!kIsWeb) {
    final selectedMap = ref.read(selectedMapsApp);
    if (selectedMap != null) {
      if (await MapLauncher.isMapAvailable(selectedMap.mapType) ?? false) {
        await MapLauncher.showDirections(
          mapType: selectedMap.mapType,
          directionsMode: DirectionsMode.walking,
          destinationTitle: name,
          destination: Coords(location.latitude, location.longitude),
        );
      } else {
        _fallback(name, location);
      }
    } else {
      _fallback(name, location);
    }
  }
}

Future<void> _fallback(String name, Location location) async {
  if (await MapLauncher.isMapAvailable(MapType.google) ?? false) {
    await MapLauncher.showDirections(
      mapType: MapType.google,
      directionsMode: DirectionsMode.walking,
      destinationTitle: name,
      destination: Coords(location.latitude, location.longitude),
    );
  } else if (await MapLauncher.isMapAvailable(MapType.apple) ?? false) {
    await MapLauncher.showDirections(
      mapType: MapType.apple,
      directionsMode: DirectionsMode.walking,
      destinationTitle: name,
      destination: Coords(location.latitude, location.longitude),
    );
  }
}
