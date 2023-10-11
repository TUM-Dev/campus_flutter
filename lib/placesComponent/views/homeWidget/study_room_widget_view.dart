import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_room_group_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudyRoomWidgetView extends ConsumerStatefulWidget {
  factory StudyRoomWidgetView(StudyRoomGroup? studyRoomGroup) {
    if (studyRoomGroup == null) {
      return const StudyRoomWidgetView.closest();
    } else {
      return StudyRoomWidgetView.group(
        studyRoomGroup: studyRoomGroup,
      );
    }
  }

  const StudyRoomWidgetView.closest(
      {super.key, this.studyRoomGroup, this.closestStudyRoom = true});

  const StudyRoomWidgetView.group(
      {super.key, required this.studyRoomGroup, this.closestStudyRoom = false});

  final StudyRoomGroup? studyRoomGroup;
  final bool closestStudyRoom;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StudyRoomWidgetViewState();
}

class _StudyRoomWidgetViewState extends ConsumerState<StudyRoomWidgetView> {
  @override
  void initState() {
    if (widget.closestStudyRoom) {
      ref.read(studyRoomsViewModel).fetchClosestStudyRoom(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.closestStudyRoom) {
      return WidgetFrameView(
        title: context.localizations.nearestStudyRooms,
        child: _streamBuilder(context),
      );
    } else {
      return _streamBuilder(context);
    }
  }

  Widget _streamBuilder(BuildContext context) {
    return StreamBuilder(
        stream: widget.closestStudyRoom
            ? ref.watch(studyRoomsViewModel).closestStudyRoom
            : ref.watch(studyRoomsViewModel).studyRooms,
        builder: (context, snapshot) {
          return GestureDetector(
              onTap: () {
                if (snapshot.hasData && snapshot.data != null) {
                  _onPressed(
                      widget.closestStudyRoom
                          ? snapshot.data! as StudyRoomGroup
                          : widget.studyRoomGroup!,
                      context);
                }
              },
              child: widget.closestStudyRoom
                  ? Card(child: _widgetLabel(snapshot, context))
                  : _widgetLabel(snapshot, context));
        });
  }

  Widget _widgetLabel(AsyncSnapshot snapshot, BuildContext context) {
    if (snapshot.hasData) {
      if (snapshot.data != null) {
        return _buttonLabel(
            widget.closestStudyRoom
                ? snapshot.data! as StudyRoomGroup
                : ref
                    .read(studyRoomsViewModel)
                    .studyRoomData!
                    .groups!
                    .firstWhere(
                        (element) => element.id == widget.studyRoomGroup!.id),
            context);
      } else {
        return ListTile(
          title: Center(
              child: Text(context.localizations.noNearFreeStudyRoomsFound)),
        );
      }
    } else if (snapshot.hasError) {
      return ListTile(
          title: ErrorHandlingView(
              error: snapshot.error!,
              errorHandlingViewType: ErrorHandlingViewType.descriptionOnly));
    } else {
      return ListTile(
          title: DelayedLoadingIndicator(
              name: context.localizations.nearestStudyRooms));
    }
  }

  _onPressed(StudyRoomGroup studyRoomGroup, BuildContext context) async {
    if (MediaQuery.orientationOf(context) == Orientation.portrait ||
        widget.studyRoomGroup != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StudyRoomGroupScaffold(studyRoomGroup)));
    } else {
      ref
          .read(homeSplitViewModel)
          .selectedWidget
          .add(StudyRoomGroupView(studyRoomGroup, true));
    }
  }

  Widget _buttonLabel(StudyRoomGroup studyRoomGroup, BuildContext context) {
    return ListTile(
      title: Text(studyRoomGroup.name ?? context.localizations.unknown),
      subtitle: _freeRooms(studyRoomGroup),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
    );
  }

  Widget _freeRooms(StudyRoomGroup studyRoomGroup) {
    final freeRooms = ref.read(studyRoomsViewModel).freeRooms(studyRoomGroup);
    return Text(context.localizations.nfreeRooms(freeRooms),
        style: TextStyle(color: freeRooms > 0 ? Colors.green : Colors.red));
  }
}
