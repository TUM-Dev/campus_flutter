import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
import 'package:campus_flutter/base/helpers/paddedDivider.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/studyRoom.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/studyRoomGroup.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_room_row_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudyRoomGroupScaffold extends StatelessWidget {
  const StudyRoomGroupScaffold({super.key, required this.studyRoomGroup, required this.studyRooms});

  final StudyRoomGroup studyRoomGroup;
  final List<StudyRoom> studyRooms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: StudyRoomGroupView(studyRoomGroup: studyRoomGroup, studyRooms: studyRooms),
    );
  }
}

class StudyRoomGroupView extends ConsumerWidget {
  const StudyRoomGroupView({super.key, required this.studyRoomGroup, required this.studyRooms});

  final StudyRoomGroup studyRoomGroup;
  final List<StudyRoom> studyRooms;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(studyRoomGroup.name.toString(),
                  style: Theme.of(context).textTheme.titleLarge)),
          //const PaddedDivider(),
          WidgetFrameView(
              title: "Rooms",
              child: CardWithPadding(
                  child: Column(
                children: [
                  for (var studyRoom in studyRooms.indexed) ...[
                    GestureDetector(onTap: () {
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                    }, child: StudyRoomRowView(studyRoom: studyRoom.$2)),
                    if (studyRoom.$1 != studyRooms.length - 1) const Divider()
                  ]
                ],
              )))
        ],
      ),
    );
  }
}
