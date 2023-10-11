import 'package:campus_flutter/placesComponent/model/studyRooms/study_room.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudyRoomRowView extends ConsumerWidget {
  const StudyRoomRowView({super.key, required this.studyRoom});

  final StudyRoom studyRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
          "${studyRoom.name ?? context.localizations.unknown} (${studyRoom.code ?? context.localizations.unknown})"),
      subtitle: Text(
        studyRoom.localizedStatus(context),
        style: TextStyle(
            color: _statusColor(studyRoom.localizedStatus(context), context)),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: () {
        // TODO(Jakob): NavigaTUM Integration
      },
    );
  }

  Color _statusColor(String status, BuildContext context) {
    if (status == context.localizations.free) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
