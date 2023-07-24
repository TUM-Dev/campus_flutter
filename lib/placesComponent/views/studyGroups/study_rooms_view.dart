import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/study_room_widget_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudyRoomsScaffold extends StatelessWidget {
  const StudyRoomsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Study Rooms"),
      ),
      body: const StudyRoomsView(),
    );
  }
}

class StudyRoomsView extends ConsumerStatefulWidget {
  const StudyRoomsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudyRoomsViewState();
}

class _StudyRoomsViewState extends ConsumerState<StudyRoomsView> {
  @override
  void initState() {
    ref.read(studyRoomsViewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(studyRoomsViewModel).studyRooms,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                for (var studyRoomGroup in snapshot.data!.keys)
                  Card(
                      child: StudyRoomWidgetView(
                    studyRoomGroup,
                  ))
              ],
            );
          } else if (snapshot.hasError) {
            return ErrorHandlingView(
              error: snapshot.error!,
              errorHandlingViewType: ErrorHandlingViewType.fullScreen,
              retry: ref.read(studyRoomsViewModel).fetch,
            );
          } else {
            return const DelayedLoadingIndicator(
              name: "Study Rooms",
            );
          }
        });
  }
}
