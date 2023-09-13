import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudyRoomRowView extends ConsumerWidget {
  const StudyRoomRowView({super.key, required this.studyRoom});

  final StudyRoom studyRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(studyRoom.name ?? context.localizations.unknown,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w500)),
                  IconText(
                      iconData: Icons.numbers,
                      label: studyRoom.code ?? context.localizations.unknown)
                ])),
            Expanded(
                child: Text(
              studyRoom.localizedStatus(context),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: _statusColor(
                      studyRoom.localizedStatus(context), context)),
            )),
            //const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
            //const Icon(Icons.arrow_forward_ios, size: 15)
          ],
        ));
  }

  Color _statusColor(String status, BuildContext context) {
    if (status == context.localizations.free) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
