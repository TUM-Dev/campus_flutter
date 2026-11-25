import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/places_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/study_rooms_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_map_legend.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:campus_flutter/settingsComponent/views/default_campus_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:material_ui/material_ui.dart';

class CampusMapScaffold extends StatelessWidget {
  const CampusMapScaffold({super.key, required this.campus});

  final Campus campus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(defaultCampusLabel(context, campus)),
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
    final cafeteriasVM = ref.watch(cafeteriasViewModel);
    final studyRoomsVM = ref.watch(studyRoomsViewModel);
    return StreamBuilder(
      stream: cafeteriasVM.campusCafeterias,
      initialData: cafeteriasVM.campusCafeterias.value,
      builder: (context, _) {
        return StreamBuilder(
          stream: studyRoomsVM.campusStudyRooms,
          initialData: studyRoomsVM.campusStudyRooms.value,
          builder: (context, _) {
            return MapWidget.noPadding(
              aspectRatioNeeded: false,
              markers: ref
                  .read(placesViewModel)
                  .getCampusMarkers(context, campus),
              latLng: LatLng(
                campus.location.latitude,
                campus.location.longitude,
              ),
              zoom: 15,
              roundedCorners: false,
              mapLegend: const CampusMapLegend(),
            );
          },
        );
      },
    );
  }
}
