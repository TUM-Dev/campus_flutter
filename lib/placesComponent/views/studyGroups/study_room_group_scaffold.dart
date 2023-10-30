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
