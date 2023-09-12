import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_group.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_room_group_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return WidgetFrameView(
        title: AppLocalizations.of(context)!.nearestStudyRooms,
        child: StreamBuilder(
            stream: ref.watch(studyRoomWidgetViewModel).studyRoomGroup,
            builder: (context, snapshot) {
              return GestureDetector(
                  onTap: () {
                    if (snapshot.hasData && snapshot.data != null) {
                      _onPressed(context);
                    }
                  },
                  child: CardWithPadding(
                      height: MediaQuery.sizeOf(context).height * 0.075,
                      child: _widgetLabel(snapshot, context)));
            }));
  }

  Widget _widgetLabel(AsyncSnapshot<StudyRoomGroup?> snapshot, BuildContext context) {
    if (snapshot.hasData) {
      if (snapshot.data != null) {
        return _buttonLabel(context, snapshot);
      } else {
        return Center(child: Text(AppLocalizations.of(context)!.noNearFreeStudyRoomsFound));
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
    if (MediaQuery.orientationOf(context) == Orientation.portrait) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
          const StudyRoomGroupScaffold()));
    } else {
      ref.read(homeSplitViewModel).selectedWidget.add(const StudyRoomGroupView());
    }
  }

  Widget _buttonLabel(BuildContext context, AsyncSnapshot<StudyRoomGroup?> snapshot) {
    return Row(
      children: [
        Text(snapshot.data?.name ?? AppLocalizations.of(context)!.unknown),
        const Spacer(),
        _freeRooms(snapshot),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        const Icon(Icons.arrow_forward_ios, size: 15)
      ],
    );
  }

  Widget _freeRooms(AsyncSnapshot<StudyRoomGroup?> snapshot) {
    if (snapshot.data?.rooms != null) {
      final freeRooms = ref.read(studyRoomWidgetViewModel).countAvailableRooms();
      return Text(
          AppLocalizations.of(context)!.nfreeRooms(freeRooms),
          style: TextStyle(color: freeRooms > 0 ? Colors.green : Colors.red));
    } else {
      return Text(AppLocalizations.of(context)!.nfreeRooms(0), style: const TextStyle(color: Colors.red));
    }
  }
}
