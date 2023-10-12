import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/horizontal_slider.dart';
import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api.dart';
import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api_serivce.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_roomfinder_map.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';

class NavigaTumRoomMapsView extends StatelessWidget {
  const NavigaTumRoomMapsView({super.key, required this.maps});

  final List<NavigaTumRoomFinderMap> maps;

  @override
  Widget build(BuildContext context) {
    return WidgetFrameView(
      title: context.localizations.map,
      child: CardWithPadding(
        child: HorizontalSlider.aspectRatio(
          leadingTrailingPadding: false,
          data: maps,
          child: (map) {
            return CachedNetworkImage(
                imageUrl: NavigaTumApi(
                        navigaTumApiService:
                            NavigaTumApiServiceImages(id: map.imageUrl))
                    .asURL()
                    .toString());
          },
          aspectRatio: 2,
        ),
      ),
    );
  }
}
