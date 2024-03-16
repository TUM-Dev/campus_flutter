import 'package:campus_flutter/base/classes/location.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:map_launcher/map_launcher.dart';

Future<void> showDirectionsDialog(
  String name,
  Location location,
  BuildContext context,
) async {
  MapLauncher.installedMaps.then(
    (value) => showModalBottomSheet(
      isDismissible: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: context.halfPadding,
              ),
              child: Text(context.localizations.selectAction),
            ),
            Card(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SvgPicture.asset(
                      value[index].icon,
                      height: 30,
                      width: 30,
                    ),
                  ),
                  title: Text(
                    context.localizations.openIn(value[index].mapName),
                  ),
                  onTap: () => MapLauncher.showDirections(
                    mapType: value[index].mapType,
                    directionsMode: DirectionsMode.walking,
                    destinationTitle: name,
                    destination: Coords(location.latitude, location.longitude),
                  ),
                ),
                separatorBuilder: (context, index) => const PaddedDivider(),
                itemCount: value.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: context.padding,
                bottom: context.padding * 2,
              ),
              child: ElevatedButton(
                onPressed: () => context.pop(),
                child: Text(context.localizations.cancel),
              ),
            ),
          ],
        );
      },
    ),
  );
}
