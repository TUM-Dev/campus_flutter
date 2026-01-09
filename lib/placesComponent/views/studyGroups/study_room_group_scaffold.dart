import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/util/info_row.dart';
import 'package:campus_flutter/base/util/map_launcher.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_opening_hours.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_room_group_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

class StudyRoomGroupScaffold extends ConsumerWidget {
  factory StudyRoomGroupScaffold(StudyRoomGroup? studyRoomGroup) {
    if (studyRoomGroup == null) {
      return const StudyRoomGroupScaffold.closest();
    } else {
      return StudyRoomGroupScaffold.group(studyRoomGroup: studyRoomGroup);
    }
  }

  const StudyRoomGroupScaffold.closest({
    super.key,
    this.studyRoomGroup,
    this.isSplitView = false,
  });

  const StudyRoomGroupScaffold.group({
    super.key,
    required this.studyRoomGroup,
    this.isSplitView = false,
  });

  final StudyRoomGroup? studyRoomGroup;
  final bool isSplitView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        actions: [
          if (studyRoomGroup != null && studyRoomGroup!.openingHours.isNotEmpty)
            IconButton(
              onPressed: () =>
                  _openAlert(studyRoomGroup!.openingHours, context),
              icon: Icon(
                Icons.access_time_filled,
                color: context.theme.primaryColor,
              ),
            ),
          if (studyRoomGroup != null && studyRoomGroup?.coordinate != null)
            IconButton(
              onPressed: () => showDirectionsDialog(
                studyRoomGroup!.name,
                LatLng(
                  studyRoomGroup!.coordinate!.latitude,
                  studyRoomGroup!.coordinate!.longitude,
                ),
                context,
              ),
              icon: Icon(Icons.directions, color: context.theme.primaryColor),
            ),
        ],
      ),
      body: studyRoomGroup != null
          ? StudyRoomGroupView(studyRoomGroup, isSplitView)
          : StudyRoomGroupView(null, isSplitView),
    );
  }

  void _openAlert(
    List<StudyRoomOpeningHours> openingHours,
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            context.tr("openingHours"),
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var openingHour in openingHours)
                InfoRow(
                  title: context.tr(
                    "fromTo",
                    args: [
                      context.tr(openingHour.firstDay),
                      if (openingHour.lastDay != null)
                        context.tr(openingHour.lastDay!),
                    ],
                  ),
                  info: context.tr(
                    "fromTo",
                    args: [openingHour.startString, openingHour.endString],
                  ),
                ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text("Okay"),
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }
}
