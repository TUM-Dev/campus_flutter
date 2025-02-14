import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StudyRoomRowView extends ConsumerWidget {
  const StudyRoomRowView({super.key, required this.studyRoom});

  final StudyRoom studyRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(title(studyRoom, context)),
      subtitle: Text(
        studyRoom.localizedStatus(context),
        style: TextStyle(color: studyRoom.color),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
      onTap:
          () => context.push(
            navigaTum,
            extra: studyRoom.roomNoArchitect ?? "null",
          ),
    );
  }

  String title(StudyRoom studyRoom, BuildContext context) {
    if (studyRoom.name == null && studyRoom.roomNoArchitect == null) {
      return context.tr("unknownStudyRoom");
    } else if (studyRoom.name != null && studyRoom.roomNoArchitect == null) {
      return studyRoom.roomNoArchitect!;
    } else if (studyRoom.name == null && studyRoom.roomNoArchitect != null) {
      return studyRoom.name!;
    } else {
      return "${studyRoom.name} (${studyRoom.roomNoArchitect})";
    }
  }
}
