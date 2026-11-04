import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:map_launcher/map_launcher.dart';

Future<void> showDirectionsDialog(
  String name,
  LatLng location,
  BuildContext context,
) async {
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
                          child: Image.memory(
                            value[index].iconBytes,
                            height: 30,
                            width: 30,
                          ),
                        ),
                        title: Text(
                          context.tr("openIn", args: [value[index].name]),
                        ),
                        onTap: () => value[index].show(),
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
