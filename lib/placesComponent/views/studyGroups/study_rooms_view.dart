import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/study_room_widget_view.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudyRoomsScaffold extends StatelessWidget {
  const StudyRoomsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(context.localizations.studyRooms),
      ),
      body: const StudyRoomsView(),
    );
  }
}

class StudyRoomsView extends ConsumerStatefulWidget {
  const StudyRoomsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudyRoomsViewState();
}

class _StudyRoomsViewState extends ConsumerState<StudyRoomsView> {
  @override
  void initState() {
    ref.read(studyRoomsViewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(studyRoomsViewModel).studyRooms,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return OrientationBuilder(builder: (context, orientation) {
              if (orientation == Orientation.landscape) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: MapWidget.customPadding(
                          padding: EdgeInsets.only(
                              left: context.padding,
                              right: context.padding,
                              top: context.halfPadding,
                              bottom: context.padding),
                          markers:
                              ref.read(studyRoomsViewModel).mapMakers(context)),
                    ),
                    Expanded(
                        child:
                            _studyRoomList(snapshot.data!.keys.toList(), false))
                  ],
                );
              } else {
                return SingleChildScrollView(
                    child: Column(
                  children: [
                    MapWidget.horizontalPadding(
                      markers: ref.read(studyRoomsViewModel).mapMakers(context),
                    ),
                    const PaddedDivider(),
                    _studyRoomList(snapshot.data!.keys.toList(), true)
                  ],
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
            return DelayedLoadingIndicator(
              name: context.localizations.studyRooms,
            );
          }
        });
  }

  Widget _studyRoomList(List<StudyRoomGroup> studyRoomGroups, bool portrait) {
    return WidgetFrameView(
        title: portrait ? context.localizations.studyRooms : null,
        child: Column(
          children: [
            Card(
                child: SeparatedList.list(
              data: studyRoomGroups,
              tile: (studyRoomGroup) => StudyRoomWidgetView(studyRoomGroup),
            ))
          ],
        ));
  }
}
