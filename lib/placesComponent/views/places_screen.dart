import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/places_viewmodel.dart';
import 'package:campus_flutter/placesComponent/viewModels/study_rooms_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/places_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<List<dynamic>> _fetchFuture;

  @override
  void initState() {
    super.initState();
    _fetchFuture = _load(false);
  }

  Future<List<dynamic>> _load(bool forcedRefresh) {
    return Future.wait([
      ref.read(studyRoomsViewModel).fetch(forcedRefresh),
      ref.read(cafeteriasViewModel).fetch(forcedRefresh),
      ref.read(placesViewModel).fetch(forcedRefresh),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const PlacesView();
        } else if (snapshot.hasError) {
          return ErrorHandlingRouter(
            error: snapshot.error!,
            stackTrace: snapshot.stackTrace,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: () => setState(() {
              _fetchFuture = _load(true);
            }),
          );
        } else {
          return DelayedLoadingIndicator(
            name: "${context.tr("cafeterias")} & ${context.tr("studyRooms")}",
          );
        }
      },
    );
  }
}
