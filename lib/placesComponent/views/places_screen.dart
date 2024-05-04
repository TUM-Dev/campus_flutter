import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/places_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/study_rooms_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/places_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen>
    with AutomaticKeepAliveClientMixin<PlacesScreen> {
  @override
  void initState() {
    ref.read(placesViewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: Future.wait([
        ref.watch(studyRoomsViewModel).fetch(false),
        ref.watch(cafeteriasViewModel).fetch(false),
        ref.watch(placesViewModel).fetch(false),
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const PlacesView();
        } else if (snapshot.hasError) {
          return ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: (() => ref.read(placesViewModel).fetch(true)),
          );
        } else {
          return DelayedLoadingIndicator(
            name: "${context.tr("cafeterias")} & ${context.tr("studyRooms")}",
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
