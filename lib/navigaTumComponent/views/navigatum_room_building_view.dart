import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/navigaTumComponent/model/details/navigatum_navigation_coordinates.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NavigaTumRoomBuildingView extends StatelessWidget {
  const NavigaTumRoomBuildingView({super.key, required this.coordinates});

  final NavigaTumNavigationCoordinates coordinates;

  @override
  Widget build(BuildContext context) {
    return WidgetFrameView(
      title: context.localizations.building,
      child: MapWidget.fullPadding(
        zoom: 17,
        latLng: LatLng(coordinates.latitude!, coordinates.longitude!),
        markers: {
          Marker(
              markerId: const MarkerId("1"),
              position: LatLng(coordinates.latitude!, coordinates.longitude!))
        },
      ),
    );
  }
}
