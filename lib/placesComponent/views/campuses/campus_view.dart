import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/base/util/seperated_list.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_campus_viewmodel.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/places_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/study_rooms_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/cafeteria_row_view.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_most_searched_view.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/study_room_widget_view.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      child: CampusView(
        campus: campus,
        orientation: orientation,
      ),
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
  late List<Cafeteria> cafeterias;
  late List<StudyRoomGroup> studyRooms;

  @override
  void initState() {
    ref.read(navigaTumCampusViewModel(widget.campus)).mostSearched(false);
    cafeterias =
        ref.read(cafeteriasViewModel).campusCafeterias.value?[widget.campus] ??
            [];
    studyRooms =
        ref.read(studyRoomsViewModel).campusStudyRooms.value?[widget.campus] ??
            [];
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: WidgetFrameView(
            title: context.tr("map"),
            child: Expanded(
              child: MapWidget.fullPadding(
                aspectRatioNeeded: false,
                markers: ref
                    .read(placesViewModel)
                    .getCampusMarkers(context, widget.campus),
                latLng: LatLng(
                  widget.campus.location.latitude,
                  widget.campus.location.longitude,
                ),
                zoom: 15,
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: _campusWidgets(),
          ),
        ),
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
    return Column(
      children: [
        Column(
          children: [
            if (cafeterias.isNotEmpty)
              WidgetFrameView(
                titleWidget: IconText(
                  iconData: Icons.location_pin,
                  label: context.tr("cafeterias"),
                  style: Theme.of(context).textTheme.titleMedium,
                  leadingIcon: false,
                ),
                child: Card(
                  child: SeparatedList.list(
                    data: cafeterias,
                    tile: (cafeteria) => CafeteriaRowView(cafeteria: cafeteria),
                  ),
                ),
              ),
            if (studyRooms.isNotEmpty)
              WidgetFrameView(
                titleWidget: IconText(
                  iconData: Icons.location_pin,
                  label: context.tr("studyRooms"),
                  iconColor: Colors.red,
                  style: Theme.of(context).textTheme.titleMedium,
                  leadingIcon: false,
                ),
                child: Card(
                  child: SeparatedList.list(
                    data: studyRooms,
                    tile: (studyRoomGroup) =>
                        StudyRoomWidgetView(studyRoomGroup),
                  ),
                ),
              ),
            CampusMostSearchedView(
              campus: widget.campus,
            ),
          ],
        ),
      ],
    );
  }
}
