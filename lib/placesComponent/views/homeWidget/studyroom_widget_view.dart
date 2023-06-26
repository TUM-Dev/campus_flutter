import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/studyRoomGroup.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_room_group_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudyRoomWidgetView extends ConsumerStatefulWidget {
  const StudyRoomWidgetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudyRoomWidgetViewState();
}

class _StudyRoomWidgetViewState extends ConsumerState<StudyRoomWidgetView> {
  @override
  void initState() {
    ref.read(studyRoomWidgetViewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(studyRoomWidgetViewModel).studyRoomGroup,
        builder: (context, snapshot) {
          return GestureDetector(
              onTap: () {
                if (snapshot.hasData && snapshot.data != null) {
                  _onPressed(context);
                }
              },
              child: CardWithPadding(height: 60, child: _widgetLabel(snapshot, context)));
        });
  }

  Widget _widgetLabel(AsyncSnapshot<StudyRoomGroup?> snapshot, BuildContext context) {
    if (snapshot.hasData) {
      if (snapshot.data != null) {
        return _buttonLabel(context, snapshot);
      } else {
        return const Center(child: Text("no study rooms near you found"));
      }
    } else if (snapshot.hasError) {
      return ErrorHandlingView(
          error: snapshot.error!,
          errorHandlingViewType: ErrorHandlingViewType.descriptionOnly,
          retry: ref.read(studyRoomWidgetViewModel).fetch
      );
    } else {
      return const DelayedLoadingIndicator(name: "Closest Study Room");
    }
  }

  _onPressed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            const StudyRoomGroupScaffold()));
  }

  Widget _buttonLabel(BuildContext context, AsyncSnapshot<StudyRoomGroup?> snapshot) {
    return Row(
      children: [
        Text(snapshot.data?.name ?? "Unkown"),
        const Spacer(),
        _freeRooms(snapshot),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        const Icon(Icons.arrow_forward_ios, size: 15)
      ],
    );
  }

  Widget _freeRooms(AsyncSnapshot<StudyRoomGroup?> snapshot) {
    if (snapshot.data?.rooms != null) {
      return Text(
          "${snapshot.data?.rooms?.length} room${snapshot.data!.rooms!.length > 1 ? "s" : ""} free",
          style: const TextStyle(color: Colors.green));
    } else {
      return const Text("no free rooms", style: TextStyle(color: Colors.red));
    }
  }
}
