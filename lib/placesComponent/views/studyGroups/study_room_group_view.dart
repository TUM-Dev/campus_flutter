import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/last_updated_text.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/viewModels/study_rooms_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_room_row_view.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  const StudyRoomGroupView.closest({
    super.key,
    this.studyRoomGroup,
    required this.isSplitView,
  });

  const StudyRoomGroupView.group({
    super.key,
    required this.studyRoomGroup,
    required this.isSplitView,
  });

  final StudyRoomGroup? studyRoomGroup;
  final bool isSplitView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.watch(studyRoomsViewModel).studyRooms,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final studyRoomGroup = snapshot.data!.keys.firstWhereOrNull(
            (element) => element.id == this.studyRoomGroup?.id,
          );
          final studyRooms =
              ref.read(studyRoomsViewModel).studyRooms.value?[studyRoomGroup];
          final lastFetched = ref.read(studyRoomsViewModel).lastFetched;
          return OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.landscape && !isSplitView) {
                return _landscape(
                  studyRoomGroup,
                  studyRooms,
                  lastFetched,
                  orientation,
                  context,
                  ref,
                );
              } else {
                return _body(
                  studyRoomGroup,
                  studyRooms,
                  lastFetched,
                  orientation,
                  context,
                  ref,
                );
              }
            },
          );
        } else if (snapshot.hasError) {
          return ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: (() => ref.read(studyRoomsViewModel).fetch(true)),
          );
        } else {
          return const DelayedLoadingIndicator(name: "Study Rooms");
        }
      },
    );
  }

  Widget _body(
    StudyRoomGroup? studyRoomGroup,
    List<StudyRoom>? studyRooms,
    DateTime? lastFetched,
    Orientation orientation,
    BuildContext context,
    WidgetRef ref,
  ) {
    return RefreshIndicator(
      onRefresh: () => ref.read(studyRoomsViewModel).fetch(true),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.padding),
              child: Text(
                studyRoomGroup?.name ?? context.tr("unknown"),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            if (orientation == Orientation.portrait) ...[
              if (studyRoomGroup?.coordinate != null)
                _portraitMap(studyRoomGroup, context),
            ],
            WidgetFrameView(
              title: context.tr("rooms"),
              subtitle:
                  lastFetched != null ? LastUpdatedText(lastFetched) : null,
              child: Card(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => StudyRoomRowView(studyRoom: studyRooms![index]),
                  separatorBuilder: (context, index) => PaddedDivider(height: 0,),
                  itemCount: (studyRooms ?? []).length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _landscape(
    StudyRoomGroup? studyRoomGroup,
    List<StudyRoom>? studyRooms,
    DateTime? lastFetched,
    Orientation orientation,
    BuildContext context,
    WidgetRef ref,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _landscapeMap(studyRoomGroup, context),
        ),
        Expanded(
          child: _body(
            studyRoomGroup,
            studyRooms,
            lastFetched,
            orientation,
            context,
            ref,
          ),
        ),
      ],
    );
  }

  Widget _portraitMap(StudyRoomGroup? studyRoomGroup, BuildContext context) {
    return MapWidget.fullPadding(
      markers: {
        Marker(
          markerId: const MarkerId("studyRoomMarker"),
          position: LatLng(
            studyRoomGroup!.coordinate!.latitude,
            studyRoomGroup.coordinate!.longitude,
          ),
          infoWindow: InfoWindow(
            title: studyRoomGroup.name,
          ),
        ),
      },
      latLng: LatLng(
        studyRoomGroup.coordinate?.latitude ?? 0.0,
        studyRoomGroup.coordinate?.longitude ?? 0.0,
      ),
      zoom: 15,
      aspectRatio: 2,
    );
  }

  Widget _landscapeMap(StudyRoomGroup? studyRoomGroup, BuildContext context) {
    return MapWidget.fullPadding(
      markers: studyRoomGroup != null
          ? {
              Marker(
                markerId: const MarkerId("studyRoomMarker"),
                position: LatLng(
                  studyRoomGroup.coordinate?.latitude ?? 0.0,
                  studyRoomGroup.coordinate?.longitude ?? 0.0,
                ),
                infoWindow: InfoWindow(
                  title: studyRoomGroup.name,
                ),
              ),
            }
          : {},
      latLng: studyRoomGroup != null
          ? LatLng(
              studyRoomGroup.coordinate?.latitude ?? 0.0,
              studyRoomGroup.coordinate?.longitude ?? 0.0,
            )
          : null,
      zoom: 15,
      aspectRatio: 2,
    );
  }
}
