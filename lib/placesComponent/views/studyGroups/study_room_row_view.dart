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
      title: Text(
        "${studyRoom.name ?? context.tr("unknown")} (${studyRoom.code ?? context.tr("unknown")})",
      ),
      subtitle: Text(
        studyRoom.localizedStatus(context),
        style: TextStyle(
          color: _statusColor(studyRoom.localizedStatus(context), context),
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: () =>
          context.push(navigaTum, extra: studyRoom.roomNoArchitect ?? "null"),
    );
  }

  Color _statusColor(String status, BuildContext context) {
    if (status == context.tr("free")) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
