import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(studyRoom.name ?? AppLocalizations.of(context)!.unknown,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
              IconText(iconData: Icons.numbers, label: studyRoom.code ?? AppLocalizations.of(context)!.unknown)
            ])),
            Expanded(
                child: Text(
              studyRoom.localizedStatus,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: _statusColor(studyRoom.localizedStatus)),
            )),
            //const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
            //const Icon(Icons.arrow_forward_ios, size: 15)
          ],
        ));
  }

  Color _statusColor(String status) {
    if (status == "Free") {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
