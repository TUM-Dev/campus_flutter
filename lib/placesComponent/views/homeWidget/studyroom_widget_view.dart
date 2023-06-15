import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/studyRoomGroup.dart';
import 'package:campus_flutter/placesComponent/viewModels/studyroom_widget_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudyRoomWidgetView extends StatefulWidget {
  const StudyRoomWidgetView({super.key});

  @override
  State<StatefulWidget> createState() => _StudyRoomWidgetViewState();
}

class _StudyRoomWidgetViewState extends State<StudyRoomWidgetView> {

  @override
  void initState() {
    Provider.of<StudyRoomWidgetViewModel>(context, listen: false).getClosestRooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CardWithPadding(
        height: 60,
        child: StreamBuilder(
            stream: Provider.of<StudyRoomWidgetViewModel>(context, listen: true).studyRoomGroup,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => _onPressed(context),
                    child: _buttonLabel(context, snapshot));
              } else if (snapshot.hasError) {
                return const Center(child: Text("no study rooms near you found"));
              } else {
                return const DelayedLoadingIndicator(name: "Closest Study Room");
              }
            }));
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