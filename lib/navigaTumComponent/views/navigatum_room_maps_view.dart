import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/util/card_with_padding.dart';
import 'package:campus_flutter/base/util/horizontal_slider.dart';
import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api.dart';
import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api_endpoint.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_roomfinder_map.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigaTumRoomMapsView extends StatelessWidget {
  const NavigaTumRoomMapsView({super.key, required this.maps});

  final List<NavigaTumRoomFinderMap> maps;

  @override
  Widget build(BuildContext context) {
    return WidgetFrameView(
      title: context.tr("map"),
      child: CardWithPadding(
        child: maps.isNotEmpty
            ? HorizontalSlider.aspectRatio(
                leadingTrailingPadding: false,
                data: maps,
                child: (map) {
                  return InkWell(
                    child: CachedNetworkImage(
                      imageUrl: NavigaTumApi(
                        navigaTumApiEndpoint:
                            NavigaTumApiEndpointImages(id: map.imageUrl),
                      ).asURL().toString(),
                    ),
                    onTap: () => context.push(
                      networkImage,
                      extra: (
                        NavigaTumApi(
                          navigaTumApiEndpoint:
                              NavigaTumApiEndpointImages(id: map.imageUrl),
                        ).asURL().toString(),
                        map
                      ),
                    ),
                  );
                },
                aspectRatio: 2,
              )
            : Center(
                child: Text(
                  context.tr(
                    "noEntriesFound",
                    args: [context.tr("maps")],
                  ),
                ),
              ),
      ),
    );
  }
}
