import 'package:campus_flutter/base/classes/location.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/util/map_launcher.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_room_group_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          if (studyRoomGroup != null && studyRoomGroup?.coordinate != null)
            IconButton(
              onPressed: () => showDirectionsDialog(
                studyRoomGroup!.name,
                Location(
                  latitude: studyRoomGroup!.coordinate!.latitude,
                  longitude: studyRoomGroup!.coordinate!.longitude,
                ),
                context,
              ),
              icon: Icon(
                Icons.directions,
                color: context.theme.primaryColor,
              ),
            ),
        ],
      ),
      body: studyRoomGroup != null
          ? StudyRoomGroupView(studyRoomGroup, isSplitView)
          : StudyRoomGroupView(null, isSplitView),
    );
  }
}
