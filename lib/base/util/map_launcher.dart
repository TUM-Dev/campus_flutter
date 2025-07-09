import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';

Future<void> showDirectionsDialog(
  String name,
  LatLng location,
  BuildContext context,
) async {
  MapLauncher.installedMaps.then((value) {
    if (context.mounted) {
      showModalBottomSheet(
        isDismissible: true,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: context.halfPadding),
                child: Text(context.tr("selectAction")),
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
                      context.tr("openIn", args: [value[index].mapName]),
                    ),
                    onTap: () => MapLauncher.showMarker(
                      mapType: value[index].mapType,
                      title: name,
                      coords: Coords(location.latitude, location.longitude),
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
                  child: Text(context.tr("cancel")),
                ),
              ),
            ],
          );
        },
      );
    }
  });
}
