import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/homeComponent/view/widget/preference_selection_view.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/viewModels/study_rooms_viewmodel.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

  const StudyRoomWidgetView.closest({
    super.key,
    this.studyRoomGroup,
    this.closestStudyRoom = true,
  });

  const StudyRoomWidgetView.group({
    super.key,
    required this.studyRoomGroup,
    this.closestStudyRoom = false,
  });

  final StudyRoomGroup? studyRoomGroup;
  final bool closestStudyRoom;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StudyRoomWidgetViewState();
}

class _StudyRoomWidgetViewState extends ConsumerState<StudyRoomWidgetView> {
  @override
  void didChangeDependencies() {
    if (widget.closestStudyRoom) {
      ref.read(studyRoomsViewModel).fetchWidgetStudyRooms(false, context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.closestStudyRoom
          ? ref.watch(studyRoomsViewModel).widgetStudyRoom
          : ref.watch(studyRoomsViewModel).studyRooms,
      builder: (context, snapshot) {
        if (widget.closestStudyRoom) {
          return WidgetFrameView(
            titleWidget: Row(
              children: [
                Expanded(
                  child: Text(
                    context.tr("studyRooms"),
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.filter_list,
                    color: context.primaryColor,
                  ),
                  onTap: () => showModalBottomSheet(
                    builder: (context) =>
                        PreferenceSelectionView<StudyRoomGroup>(
                      data: ref
                          .read(studyRoomsViewModel)
                          .getStudyRoomEntries(context),
                      entry: context.tr("studyRoom"),
                    ),
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    useSafeArea: true,
                    showDragHandle: true,
                  ),
                ),
              ],
            ),
            child: _body(snapshot),
          );
        } else {
          return _body(snapshot);
        }
      },
    );
  }

  Widget _body(AsyncSnapshot<Object?> snapshot) {
    return GestureDetector(
      onTap: () {
        if (snapshot.hasData && snapshot.data != null) {
          context.push(
            closestStudyRoom,
            extra: widget.closestStudyRoom
                ? snapshot.data! as StudyRoomGroup
                : widget.studyRoomGroup!,
          );
        }
      },
      child: widget.closestStudyRoom
          ? Card(child: _widgetLabel(snapshot, context))
          : _widgetLabel(snapshot, context),
    );
  }

  Widget _widgetLabel(AsyncSnapshot snapshot, BuildContext context) {
    if (snapshot.hasData) {
      if (snapshot.data != null) {
        return _buttonLabel(
          widget.closestStudyRoom
              ? snapshot.data! as StudyRoomGroup
              : ref.read(studyRoomsViewModel).studyRoomData!.groups!.firstWhere(
                    (element) => element.id == widget.studyRoomGroup!.id,
                  ),
          context,
        );
      } else {
        return ListTile(
          title: Center(
            child: Text(context.tr("noNearFreeStudyRoomsFound")),
          ),
        );
      }
    } else if (snapshot.hasError) {
      return ListTile(
        title: ErrorHandlingRouter(
          error: snapshot.error!,
          errorHandlingViewType: ErrorHandlingViewType.descriptionOnly,
        ),
      );
    } else {
      return ListTile(
        title: DelayedLoadingIndicator(
          name: context.tr("nearestStudyRooms"),
        ),
      );
    }
  }

  Widget _buttonLabel(StudyRoomGroup studyRoomGroup, BuildContext context) {
    return ListTile(
      title: Text(studyRoomGroup.name),
      subtitle: _freeRooms(studyRoomGroup),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
    );
  }

  Widget _freeRooms(StudyRoomGroup studyRoomGroup) {
    if (studyRoomGroup.isOpen) {
      final freeRooms = ref.read(studyRoomsViewModel).freeRooms(studyRoomGroup);
      return Text(
        context.plural("nFreeRooms", freeRooms),
        style: TextStyle(color: freeRooms > 0 ? Colors.green : Colors.red),
      );
    } else {
      return Text(
        context.tr("currentlyClosed"),
        style: TextStyle(color: Colors.red),
      );
    }
  }
}
