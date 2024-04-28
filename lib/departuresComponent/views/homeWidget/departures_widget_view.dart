import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/card_with_padding.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/departuresComponent/model/departure.dart';
import 'package:campus_flutter/departuresComponent/model/station.dart';
import 'package:campus_flutter/departuresComponent/viewModel/departures_viewmodel.dart';
import 'package:campus_flutter/departuresComponent/views/departures_details_row_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/preference_selection_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DeparturesHomeWidget extends ConsumerStatefulWidget {
  const DeparturesHomeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DeparturesHomeWidgetState();
}

class _DeparturesHomeWidgetState extends ConsumerState<DeparturesHomeWidget> {
  @override
  void deactivate() {
    ref.read(departureViewModel).timer?.cancel();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.watch(departureViewModel).departures,
      builder: (context, snapshot) {
        return WidgetFrameView(
          titleWidget: Row(
            children: [
              Expanded(
                child: Text(
                  _titleBuilder(),
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
                  builder: (context) => PreferenceSelectionView<Campus>(
                    data:
                        ref.read(departureViewModel).getCampusEntries(context),
                    entry: context.localizations.departure,
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
          child: GestureDetector(
            onTap: () => context.push(departures),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.225,
              ),
              child: CardWithPadding(
                child: StreamBuilder(
                  stream: ref.watch(departureViewModel).departures,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final station =
                          ref.watch(departureViewModel).selectedStation.value!;
                      return _widgetContent(snapshot, station);
                    } else if (snapshot.hasError) {
                      return ErrorHandlingRouter(
                        error: snapshot.error!,
                        errorHandlingViewType: ErrorHandlingViewType.textOnly,
                        retry: (() => ref.read(departureViewModel).fetch(true)),
                      );
                    } else {
                      return DelayedLoadingIndicator(
                        name: context.localizations.departures,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _titleBuilder() {
    if (ref.watch(departureViewModel).widgetCampus.value?.name != null) {
      return ref.watch(departureViewModel).widgetCampus.value!.name;
    } else {
      return context.localizations.departures;
    }
  }

  Widget _widgetContent(
    AsyncSnapshot<List<Departure>?> snapshot,
    Station station,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "${context.localizations.station} ",
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: station.name,
                style: TextStyle(
                  color: context.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (snapshot.data!.isEmpty)
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.15,
            ),
            child: const Center(
              child: Text("No Departures Found"),
            ),
          ),
        if (snapshot.data!.isNotEmpty)
          for (var departure in snapshot.data!.length > 3
              ? snapshot.data!.getRange(0, 3)
              : snapshot.data!) ...[
            const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
            DeparturesDetailsRowView(departure: departure),
          ],
      ],
    );
  }
}
