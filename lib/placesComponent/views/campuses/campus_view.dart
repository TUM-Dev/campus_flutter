import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/base/util/map_launcher.dart';
import 'package:campus_flutter/base/util/seperated_list.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_campus_viewmodel.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/places_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/study_rooms_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/cafeteria_row_view.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_map_legend.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_most_searched_view.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/study_room_widget_view.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:material_ui/material_ui.dart';

class AdaptedCampusView extends StatelessWidget {
  const AdaptedCampusView({
    super.key,
    required this.campus,
    required this.orientation,
  });

  final Campus campus;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CampusView(campus: campus, orientation: orientation),
    );
  }
}

class CampusView extends ConsumerStatefulWidget {
  const CampusView({
    super.key,
    required this.campus,
    required this.orientation,
  });

  final Campus campus;
  final Orientation orientation;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CampusViewState();
}

class _CampusViewState extends ConsumerState<CampusView> {
  @override
  void initState() {
    ref.read(navigaTumCampusViewModel(widget.campus)).mostSearched(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.orientation == Orientation.landscape) {
      return _landscapeOrientation();
    } else {
      return _portraitOrientation();
    }
  }

  Widget _landscapeOrientation() {
    final cafeteriasVM = ref.watch(cafeteriasViewModel);
    final studyRoomsVM = ref.watch(studyRoomsViewModel);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: WidgetFrameView(
            title: context.tr("map"),
            child: Expanded(
              child: StreamBuilder(
                stream: cafeteriasVM.campusCafeterias,
                initialData: cafeteriasVM.campusCafeterias.value,
                builder: (context, _) {
                  return StreamBuilder(
                    stream: studyRoomsVM.campusStudyRooms,
                    initialData: studyRoomsVM.campusStudyRooms.value,
                    builder: (context, _) {
                      return MapWidget.fullPadding(
                        aspectRatioNeeded: false,
                        markers: ref
                            .read(placesViewModel)
                            .getCampusMarkers(context, widget.campus),
                        latLng: LatLng(
                          widget.campus.location.latitude,
                          widget.campus.location.longitude,
                        ),
                        zoom: 15,
                        mapLegend: const CampusMapLegend(),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
        Expanded(child: SingleChildScrollView(child: _campusWidgets())),
      ],
    );
  }

  Widget _portraitOrientation() {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        _campusWidgets(),
      ],
    );
  }

  Widget _campusWidgets() {
    final stations = widget.campus.allStations;
    return Column(
      children: [
        StreamBuilder<Map<Campus, List<Cafeteria>>?>(
          stream: ref.watch(cafeteriasViewModel).campusCafeterias,
          initialData: ref.read(cafeteriasViewModel).campusCafeterias.value,
          builder: (context, snapshot) {
            final cafeterias = snapshot.data?[widget.campus] ?? const [];
            if (cafeterias.isEmpty) return const SizedBox.shrink();
            return WidgetFrameView(
              titleWidget: SymbolText.image(
                image: Image.asset("assets/images/map/pin_blue.webp"),
                label: context.tr("cafeterias"),
                style: Theme.of(context).textTheme.titleMedium,
                leading: false,
              ),
              child: Card(
                child: SeparatedList.list(
                  data: cafeterias,
                  tile: (cafeteria) => CafeteriaRowView(cafeteria: cafeteria),
                ),
              ),
            );
          },
        ),
        StreamBuilder<Map<Campus, List<StudyRoomGroup>>?>(
          stream: ref.watch(studyRoomsViewModel).campusStudyRooms,
          initialData: ref.read(studyRoomsViewModel).campusStudyRooms.value,
          builder: (context, snapshot) {
            final studyRooms = snapshot.data?[widget.campus] ?? const [];
            if (studyRooms.isEmpty) return const SizedBox.shrink();
            return WidgetFrameView(
              titleWidget: SymbolText.image(
                image: Image.asset("assets/images/map/pin_red.webp"),
                label: context.tr("studyRooms"),
                style: Theme.of(context).textTheme.titleMedium,
                leading: false,
              ),
              child: Card(
                child: SeparatedList.list(
                  data: studyRooms,
                  tile: (studyRoomGroup) => StudyRoomWidgetView(studyRoomGroup),
                ),
              ),
            );
          },
        ),
        if (stations.isNotEmpty)
          WidgetFrameView(
            title: context.tr("departures"),
            child: Card(
              child: SeparatedList.list(
                data: stations,
                tile: (station) => ListTile(
                  leading: const Icon(Icons.directions_transit_outlined),
                  title: Text(station.name),
                  trailing: station.location != null
                      ? const Icon(Icons.directions_outlined, size: 18)
                      : null,
                  onTap: station.location == null
                      ? null
                      : () => showDirectionsDialog(
                          station.name,
                          station.location!,
                          context,
                        ),
                ),
              ),
            ),
          ),
        CampusMostSearchedView(campus: widget.campus),
      ],
    );
  }
}
