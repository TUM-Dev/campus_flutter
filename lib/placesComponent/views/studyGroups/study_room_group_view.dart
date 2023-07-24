import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_room_row_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:collection/collection.dart';
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

  const StudyRoomGroupScaffold.closest({super.key, this.studyRoomGroup});
  const StudyRoomGroupScaffold.group({super.key, required this.studyRoomGroup});

  final StudyRoomGroup? studyRoomGroup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: studyRoomGroup != null
          ? StudyRoomGroupView(studyRoomGroup)
          : const StudyRoomGroupView.closest(),
    );
  }
}

class StudyRoomGroupView extends ConsumerWidget {
  factory StudyRoomGroupView(StudyRoomGroup? studyRoomGroup) {
    if (studyRoomGroup == null) {
      return const StudyRoomGroupView.closest();
    } else {
      return StudyRoomGroupView.group(
        studyRoomGroup: studyRoomGroup,
      );
    }
  }

  const StudyRoomGroupView.closest({super.key, this.studyRoomGroup});
  const StudyRoomGroupView.group({super.key, required this.studyRoomGroup});

  final StudyRoomGroup? studyRoomGroup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
        stream: ref.watch(studyRoomsViewModel).studyRooms,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final studyRoomGroup = snapshot.data!.keys.firstWhereOrNull(
                (element) => element.id == this.studyRoomGroup?.id);
            final studyRooms =
                ref.read(studyRoomsViewModel).studyRooms.value?[studyRoomGroup];
            final lastFetched = ref.read(studyRoomsViewModel).lastFetched;
            return RefreshIndicator(
                onRefresh: () => ref.read(studyRoomsViewModel).fetch(true),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(studyRoomGroup?.name ?? "Unknown",
                              style: Theme.of(context).textTheme.titleLarge)),
                      //const PaddedDivider(),
                      WidgetFrameView(
                          title: "Rooms",
                          subtitle: lastFetched != null
                              ? LastUpdatedText(lastFetched)
                              : null,
                          child: CardWithPadding(
                              child: Column(
                            children: [
                              for (var studyRoom
                                  in (studyRooms ?? []).indexed) ...[
                                GestureDetector(
                                    onTap: () {
                                      // TODO:
                                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                                    },
                                    child: StudyRoomRowView(
                                        studyRoom: studyRoom.$2)),
                                if (studyRoom.$1 !=
                                    (studyRooms?.length ?? 0) - 1)
                                  const Divider()
                              ]
                            ],
                          )))
                    ],
                  ),
                ));
          } else if (snapshot.hasError) {
            return ErrorHandlingView(
              error: snapshot.error!,
              errorHandlingViewType: ErrorHandlingViewType.fullScreen,
              retry: ref.read(studyRoomsViewModel).fetch,
            );
          } else {
            return const DelayedLoadingIndicator(name: "Study Rooms");
          }
        });
  }
}
