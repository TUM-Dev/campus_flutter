import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/cafeteria_row_view.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_most_searched_view.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/study_room_widget_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampusView extends ConsumerStatefulWidget {
  const CampusView({super.key, required this.campus});

  final Campus campus;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CampusViewState();
}

class _CampusViewState extends ConsumerState<CampusView> {
  late List<Cafeteria> cafeterias;
  late List<StudyRoomGroup> studyRooms;

  @override
  void initState() {
    ref
        .read(navigaTumViewModel)
        .mostSearched(widget.campus.searchStringRooms, false);
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
    return SliverToBoxAdapter(
        child: Column(
      children: [
        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        if (cafeterias.isNotEmpty)
          WidgetFrameView(
              title: "Cafeterias",
              child: CardWithPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      for (var cafeteria in cafeterias)
                        CafeteriaRowView(cafeteria: cafeteria)
                    ],
                  ))),
        if (studyRooms.isNotEmpty)
          WidgetFrameView(
              title: "Study Rooms",
              child: Card(
                  child: Column(
                children: [
                  for (var studyRoomGroup in studyRooms)
                    StudyRoomWidgetView(studyRoomGroup)
                ],
              ))),
        const CampusMostSearchedView()
      ],
    ));
  }
}
