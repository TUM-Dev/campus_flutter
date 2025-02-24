import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/placesComponent/viewModels/places_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CampusMapScaffold extends StatelessWidget {
  const CampusMapScaffold({super.key, required this.campus});

  final Campus campus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(campus.name),
        titleSpacing: 0,
      ),
      body: CampusMapView(campus: campus),
    );
  }
}

class CampusMapView extends ConsumerWidget {
  const CampusMapView({super.key, required this.campus});

  final Campus campus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        MapWidget.noPadding(
          aspectRatioNeeded: false,
          markers: ref.read(placesViewModel).getCampusMarkers(context, campus),
          latLng: LatLng(campus.location.latitude, campus.location.longitude),
          zoom: 15,
          roundedCorners: false,
          controlPadding: const EdgeInsets.all(20),
        ),
        _mapLegend(context),
      ],
    );
  }

  Widget _mapLegend(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.padding),
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.canvasColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            if (context.theme.brightness == Brightness.light)
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1.0,
                offset: Offset(0, 2),
              ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(context.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconText(
                iconData: Icons.place,
                label: context.tr("cafeterias"),
                iconColor: Colors.blue,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.halfPadding),
              ),
              IconText(
                iconData: Icons.place,
                label: context.tr("studyRooms"),
                iconColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
