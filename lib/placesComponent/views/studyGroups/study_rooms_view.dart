import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/util/seperated_list.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/viewModels/study_rooms_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/study_room_widget_view.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudyRoomsScaffold extends StatelessWidget {
  const StudyRoomsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(context.tr("studyRooms")),
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
          return OrientationBuilder(
            builder: (context, orientation) {
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
                          bottom: context.padding,
                        ),
                        markers: ref
                            .read(studyRoomsViewModel)
                            .mapMakers(context),
                      ),
                    ),
                    Expanded(
                      child: _studyRoomList(
                        snapshot.data!.keys.toList(),
                        false,
                      ),
                    ),
                  ],
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      MapWidget.fullPadding(
                        markers: ref
                            .read(studyRoomsViewModel)
                            .mapMakers(context),
                      ),
                      const PaddedDivider(),
                      _studyRoomList(snapshot.data!.keys.toList(), true),
                    ],
                  ),
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
          return DelayedLoadingIndicator(name: context.tr("studyRooms"));
        }
      },
    );
  }

  Widget _studyRoomList(List<StudyRoomGroup> studyRoomGroups, bool portrait) {
    return WidgetFrameView(
      title: portrait ? context.tr("studyRooms") : null,
      child: Column(
        children: [
          Card(
            child: SeparatedList.list(
              data: studyRoomGroups,
              tile: (studyRoomGroup) => StudyRoomWidgetView(studyRoomGroup),
            ),
          ),
        ],
      ),
    );
  }
}
