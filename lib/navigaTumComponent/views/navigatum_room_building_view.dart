import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/navigaTumComponent/model/details/navigatum_navigation_coordinates.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NavigaTumRoomBuildingView extends StatelessWidget {
  const NavigaTumRoomBuildingView({
    super.key,
    required this.coordinates,
    this.isLandScape = false,
  });

  final NavigaTumNavigationCoordinates coordinates;
  final bool isLandScape;

  @override
  Widget build(BuildContext context) {
    return WidgetFrameView(
      title: context.tr("building"),
      child: isLandScape ? Expanded(child: _map()) : _map(),
    );
  }

  MapWidget _map() {
    return MapWidget.fullPadding(
      zoom: 17,
      aspectRatioNeeded: isLandScape ? false : true,
      latLng: LatLng(coordinates.latitude!, coordinates.longitude!),
      markers: {
        Marker(
          markerId: const MarkerId("1"),
          position: LatLng(coordinates.latitude!, coordinates.longitude!),
        ),
      },
    );
  }
}
