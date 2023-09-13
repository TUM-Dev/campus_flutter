import 'package:campus_flutter/base/classes/location.dart';
import 'package:campus_flutter/base/helpers/directions_launcher.dart';
import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DirectionsButton extends ConsumerWidget {
  const DirectionsButton.latLng(
      {super.key,
      this.location,
      this.name,
      required this.latitude,
      required this.longitude});

  const DirectionsButton.location(
      {super.key,
      required this.location,
      this.name,
      this.latitude,
      this.longitude});

  final Location? location;
  final String? name;
  final double? latitude;
  final double? longitude;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: context.padding),
        child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => launchDirections(
                    Location(
                        latitude: location?.latitude ?? latitude!,
                        longitude: location?.longitude ?? longitude!),
                    name ?? "Destination",
                    ref),
                child: IconText(
                    iconData: Icons.directions,
                    label: context.localizations.showDirections))));
  }
}
