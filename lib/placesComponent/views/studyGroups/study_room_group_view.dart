import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/views/directions_button.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_room_row_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:collection/collection.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StudyRoomGroupScaffold extends ConsumerWidget {
  factory StudyRoomGroupScaffold(StudyRoomGroup? studyRoomGroup) {
    if (studyRoomGroup == null) {
      return const StudyRoomGroupScaffold.closest();
    } else {
      return StudyRoomGroupScaffold.group(
        studyRoomGroup: studyRoomGroup,
      );
    }
  }

  const StudyRoomGroupScaffold.closest(
      {super.key, this.studyRoomGroup, this.isSplitView = false});

  const StudyRoomGroupScaffold.group(
      {super.key, required this.studyRoomGroup, this.isSplitView = false});

  final StudyRoomGroup? studyRoomGroup;
  final bool isSplitView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: studyRoomGroup != null
          ? StudyRoomGroupView(studyRoomGroup, isSplitView)
          : StudyRoomGroupView(null, isSplitView),
    );
  }
}

class StudyRoomGroupView extends ConsumerWidget {
  factory StudyRoomGroupView(StudyRoomGroup? studyRoomGroup, bool isSplitView) {
    if (studyRoomGroup == null) {
      return StudyRoomGroupView.closest(isSplitView: isSplitView);
    } else {
      return StudyRoomGroupView.group(
        studyRoomGroup: studyRoomGroup,
        isSplitView: isSplitView,
      );
    }
  }

  const StudyRoomGroupView.closest(
      {super.key, this.studyRoomGroup, required this.isSplitView});

  const StudyRoomGroupView.group(
      {super.key, required this.studyRoomGroup, required this.isSplitView});

  final StudyRoomGroup? studyRoomGroup;
  final bool isSplitView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
        stream: ref.watch(studyRoomsViewModel).studyRooms,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final studyRoomGroup = snapshot.data!.keys.firstWhereOrNull(
                (element) => element.id == this.studyRoomGroup?.id);
            final studyRooms =
                ref.read(studyRoomsViewModel).studyRooms.value?[studyRoomGroup];
            final lastFetched = ref.read(studyRoomsViewModel).lastFetched;
            return OrientationBuilder(builder: (context, orientation) {
              if (orientation == Orientation.landscape && !isSplitView) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        MapWidget.horizontalPadding(
                          markers: {
                            Marker(
                                markerId: const MarkerId("studyRoomMarker"),
                                icon:
                                    BitmapDescriptor.defaultMarkerWithHue(208),
                                position: LatLng(
                                    studyRoomGroup!.coordinate!.latitude,
                                    studyRoomGroup.coordinate!.longitude),
                                infoWindow: InfoWindow(
                                    title: studyRoomGroup.name ??
                                        context.localizations.unknown)),
                          },
                          latLng: LatLng(
                              studyRoomGroup.coordinate?.latitude ?? 0.0,
                              studyRoomGroup.coordinate?.longitude ?? 0.0),
                          zoom: 15,
                          aspectRatio: 2,
                        ),
                        if (studyRoomGroup.coordinate != null)
                          DirectionsButton.latLng(
                            latitude: studyRoomGroup.coordinate!.latitude,
                            longitude: studyRoomGroup.coordinate!.longitude,
                            name: studyRoomGroup.name,
                          ),
                      ],
                    )),
                    Expanded(
                        child: RefreshIndicator(
                            onRefresh: () =>
                                ref.read(studyRoomsViewModel).fetch(true),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                          studyRoomGroup.name ??
                                              context.localizations.unknown,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge)),
                                  WidgetFrameView(
                                      title: context.localizations.rooms,
                                      subtitle: lastFetched != null
                                          ? LastUpdatedText(lastFetched)
                                          : null,
                                      child: CardWithPadding(
                                          child: Column(
                                        children: [
                                          for (var studyRoom
                                              in (studyRooms ?? [])
                                                  .indexed) ...[
                                            GestureDetector(
                                                onTap: () {
                                                  // TODO:
                                                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                                                },
                                                child: StudyRoomRowView(
                                                    studyRoom: studyRoom.$2)),
                                            if (studyRoom.$1 !=
                                                (studyRooms?.length ?? 0) - 1)
                                              const Divider()
                                          ]
                                        ],
                                      )))
                                ],
                              ),
                            )))
                  ],
                );
              } else {
                return RefreshIndicator(
                    onRefresh: () => ref.read(studyRoomsViewModel).fetch(true),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                  studyRoomGroup?.name ??
                                      context.localizations.unknown,
                                  style:
                                      Theme.of(context).textTheme.titleLarge)),
                          if (studyRoomGroup?.coordinate != null)
                            MapWidget.fullPadding(
                              markers: {
                                Marker(
                                    markerId: const MarkerId("studyRoomMarker"),
                                    icon: BitmapDescriptor.defaultMarkerWithHue(
                                        208),
                                    position: LatLng(
                                        studyRoomGroup!.coordinate!.latitude,
                                        studyRoomGroup.coordinate!.longitude),
                                    infoWindow: InfoWindow(
                                        title: studyRoomGroup.name ??
                                            context.localizations.unknown)),
                              },
                              latLng: LatLng(
                                  studyRoomGroup.coordinate?.latitude ?? 0.0,
                                  studyRoomGroup.coordinate?.longitude ?? 0.0),
                              zoom: 15,
                              aspectRatio: 2,
                            ),
                          if (studyRoomGroup?.coordinate != null)
                            DirectionsButton.latLng(
                              latitude: studyRoomGroup!.coordinate!.latitude,
                              longitude: studyRoomGroup.coordinate!.longitude,
                              name: studyRoomGroup.name,
                            ),
                          const PaddedDivider(),
                          WidgetFrameView(
                              title: context.localizations.rooms,
                              subtitle: lastFetched != null
                                  ? LastUpdatedText(lastFetched)
                                  : null,
                              child: CardWithPadding(
                                  child: Column(
                                children: [
                                  for (var studyRoom
                                      in (studyRooms ?? []).indexed) ...[
                                    GestureDetector(
                                        onTap: () {
                                          // TODO:
                                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                                        },
                                        child: StudyRoomRowView(
                                            studyRoom: studyRoom.$2)),
                                    if (studyRoom.$1 !=
                                        (studyRooms?.length ?? 0) - 1)
                                      const Divider()
                                  ]
                                ],
                              )))
                        ],
                      ),
                    ));
              }
            });
          } else if (snapshot.hasError) {
            return ErrorHandlingView(
              error: snapshot.error!,
              errorHandlingViewType: ErrorHandlingViewType.fullScreen,
              retry: ref.read(studyRoomsViewModel).fetch,
            );
          } else {
            return const DelayedLoadingIndicator(name: "Study Rooms");
          }
        });
  }
}
