import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_room_row_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudyRoomGroupScaffold extends ConsumerWidget {
  const StudyRoomGroupScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: const StudyRoomGroupView(),
    );
  }
}

class StudyRoomGroupView extends ConsumerWidget {
  const StudyRoomGroupView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
        stream: ref.watch(studyRoomWidgetViewModel).studyRoomGroup,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final studyRoomGroup = snapshot.data!;
            final studyRooms =
                ref.read(studyRoomWidgetViewModel).rooms.value!;
            final lastFetched = ref.read(studyRoomWidgetViewModel).lastFetched.value;
            return RefreshIndicator(
                onRefresh: () => ref.read(studyRoomWidgetViewModel).fetch(true),
                child: SingleChildScrollView(
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
                          subtitle: lastFetched != null ? LastUpdatedText(lastFetched) : null,
                          child: CardWithPadding(
                              child: Column(
                            children: [
                              for (var studyRoom in studyRooms.indexed) ...[
                                GestureDetector(
                                    onTap: () {
                                      // TODO:
                                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ));
                                    },
                                    child: StudyRoomRowView(
                                        studyRoom: studyRoom.$2)),
                                if (studyRoom.$1 != studyRooms.length - 1)
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
                retry: ref.read(studyRoomWidgetViewModel).fetch);
          } else {
            return const DelayedLoadingIndicator(name: "Study Rooms");
          }
        });
  }
}
