import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showDirectionsDialog(
  String name,
  LatLng location,
  BuildContext context,
) async {
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    // Let Android resolve the user's preferred map app, including apps that
    // are not in map_launcher's supported list. Non-HTTP query values must use
    // percent encoding rather than replacing spaces with '+'.
    final query = Uri.encodeComponent(
      '${location.latitude},${location.longitude}($name)',
    );
    final uri = Uri.parse('geo:0,0?q=$query');
    if (!await _tryLaunchMap(uri) && context.mounted) {
      _showMapLaunchError(context);
    }
    return;
  }

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
    // Apple's default-navigation handoff is available only on eligible
    // devices. Try it directly and retain the picker for unsupported devices.
    // Opening a URL does not require registering Campus as a navigation app.
    final coordinate = Uri.encodeComponent(
      '${location.latitude},${location.longitude}',
    );
    final uri = Uri.parse('geo-navigation:///place?coordinate=$coordinate');
    if (await _tryLaunchMap(uri)) return;
  }

  if (!context.mounted) return;

  final marker = MapLauncher.marker(
    LocationCoords(location.latitude, location.longitude, title: name),
  );
  await marker
      .getSupportedMaps(
        defaultTargetPlatform == TargetPlatform.iOS
            ? const [MapApp.apple, MapApp.google, MapApp.waze]
            : const [
                MapApp.apple,
                MapApp.google,
                MapApp.waze,
                MapApp.yandexMaps,
                MapApp.doubleGis,
                MapApp.here,
                MapApp.mapyCz,
                MapApp.mappls,
                MapApp.googleGo,
                MapApp.amap,
                MapApp.baidu,
                MapApp.yandexNavi,
                MapApp.citymapper,
                MapApp.mapswithme,
                MapApp.osmand,
                MapApp.osmandplus,
                MapApp.tencent,
                MapApp.petal,
                MapApp.tomtomgo,
                MapApp.tomtomgofleet,
                MapApp.copilot,
                MapApp.sygicTruck,
                MapApp.flitsmeister,
                MapApp.naver,
                MapApp.kakao,
                MapApp.tmap,
                MapApp.moovit,
                MapApp.neshan,
                MapApp.airnavPro,
                MapApp.magicEarth,
              ],
      )
      .then((maps) {
        final value = maps.where((map) => map.isInstalled).toList();
        if (context.mounted) {
          if (value.isEmpty) {
            _showMapLaunchError(context);
            return;
          }
          showModalBottomSheet(
            isDismissible: true,
            showDragHandle: true,
            context: context,
            builder: (sheetContext) {
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
                          child: Image.memory(
                            value[index].iconBytes,
                            height: 30,
                            width: 30,
                          ),
                        ),
                        title: Text(
                          context.tr("openIn", args: [value[index].name]),
                        ),
                        onTap: () async {
                          try {
                            await value[index].show();
                            if (sheetContext.mounted) {
                              Navigator.of(sheetContext).pop();
                            }
                          } on MapLaunchException {
                            if (sheetContext.mounted) {
                              Navigator.of(sheetContext).pop();
                            }
                            if (context.mounted) _showMapLaunchError(context);
                          }
                        },
                      ),
                      separatorBuilder: (context, index) =>
                          const PaddedDivider(),
                      itemCount: value.length,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: context.padding,
                      bottom: context.padding * 2,
                    ),
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(sheetContext).pop(),
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

Future<bool> _tryLaunchMap(Uri uri) async {
  try {
    // Launch directly: canLaunchUrl may reject schemes due to package
    // visibility restrictions even when the OS can open them.
    return await launchUrl(uri, mode: LaunchMode.externalApplication);
  } on PlatformException {
    return false;
  }
}

void _showMapLaunchError(BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(context.tr('cannotOpenMaps'))));
}
