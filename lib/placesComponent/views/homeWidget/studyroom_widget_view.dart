import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/studyRoomGroup.dart';
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
    ref.read(studyRoomWidgetViewModel).getClosestRooms();
    //Provider.of<StudyRoomWidgetViewModel>(context, listen: false).getClosestRooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onPressed(context),
      child: CardWithPadding(
          height: 60,
          child: StreamBuilder(
              stream: ref.watch(studyRoomWidgetViewModel).studyRoomGroup,
              //stream: Provider.of<StudyRoomWidgetViewModel>(context, listen: true).studyRoomGroup,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _buttonLabel(context, snapshot);
                } else if (snapshot.hasError) {
                  return const Center(child: Text("no study rooms near you found"));
                } else {
                  return const DelayedLoadingIndicator(name: "Closest Study Room");
                }
              }))
    );
  }

  _onPressed(BuildContext context) {
    // TODO: on button pressed
  }

  Widget _buttonLabel(BuildContext context, AsyncSnapshot<StudyRoomGroup?> snapshot) {
    return Row(
      children: [
        Text(snapshot.data?.name ?? "Unkown"),
        // TODO: iconText or text?
        //IconText(iconData: Icons.menu_book, label: snapshot.data?.name ?? "Unkown"),
        const Spacer(),
        _freeRooms(snapshot)
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