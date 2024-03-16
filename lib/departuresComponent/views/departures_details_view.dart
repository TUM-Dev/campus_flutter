import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/custom_back_button.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/directions_launcher.dart';
import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/departuresComponent/model/departure.dart';
import 'package:campus_flutter/departuresComponent/model/station.dart';
import 'package:campus_flutter/departuresComponent/viewModel/departures_viewmodel.dart';
import 'package:campus_flutter/departuresComponent/views/departures_details_row_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campus_flutter/base/extensions/context.dart';

class DeparturesDetailsScaffold extends ConsumerWidget {
  const DeparturesDetailsScaffold({super.key, this.isSplitView = false});

  final bool isSplitView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.watch(departureViewModel).departures,
      builder: (context, snapshot) {
        final backgroundColor = Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).canvasColor
            : Colors.white;
        return Scaffold(
          appBar: AppBar(
            leading: isSplitView ? null : const CustomBackButton(),
            backgroundColor: isSplitView ? null : backgroundColor,
            title: Text(
              ref.watch(departureViewModel).selectedStation.value?.name ??
                  context.localizations.departures,
            ),
            actions: [
              PopupMenuButton<Station>(
                initialValue:
                    ref.watch(departureViewModel).selectedStation.value,
                onSelected: (station) {
                  ref.read(departureViewModel).setSelectedStation(station);
                  ref.read(departureViewModel).fetchDepartures();
                },
                icon: const Icon(Icons.tram),
                itemBuilder: (context) =>
                    ref.read(departureViewModel).getStationEntries(),
              ),
            ],
          ),
          backgroundColor: isSplitView ? null : backgroundColor,
          body: DeparturesDetailsView(
            snapshot: snapshot,
            isSplitView: isSplitView,
          ),
        );
      },
    );
  }
}

class DeparturesDetailsView extends ConsumerStatefulWidget {
  const DeparturesDetailsView({
    super.key,
    required this.snapshot,
    this.isSplitView = false,
  });

  final AsyncSnapshot<List<Departure>?> snapshot;
  final bool isSplitView;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DeparturesDetailsViewState();
}

class _DeparturesDetailsViewState extends ConsumerState<DeparturesDetailsView> {
  @override
  Widget build(BuildContext context) {
    if (widget.snapshot.hasData) {
      final lastFetched = ref.read(departureViewModel).lastFetched.value;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (ref.watch(departureViewModel).selectedStation.value !=
                null) ...[
              Text.rich(
                TextSpan(
                  text: context.localizations.station,
                  children: [
                    TextSpan(
                      text: ref
                          .watch(departureViewModel)
                          .selectedStation
                          .value!
                          .name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Station? selectedStation =
                      ref.read(departureViewModel).selectedStation.value;
                  if (selectedStation != null &&
                      selectedStation.location != null) {
                    showDirectionsDialog(
                      selectedStation.name,
                      selectedStation.location!,
                      context,
                    );
                  }
                },
                child: IconText(
                  iconData: Icons.open_in_new,
                  label: context.localizations.showDirections,
                ),
              ),
            ],
            const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
            if (widget.isSplitView)
              Expanded(
                child: CardWithPadding(
                  margin: EdgeInsets.zero,
                  child: Column(children: _departureList(lastFetched)),
                ),
              ),
            if (!widget.isSplitView) ..._departureList(lastFetched),
          ],
        ),
      );
    } else if (widget.snapshot.hasError) {
      return ErrorHandlingRouter(
        error: widget.snapshot.error!,
        errorHandlingViewType: ErrorHandlingViewType.fullScreen,
        retry: ref.read(departureViewModel).fetch,
      );
    } else {
      return DelayedLoadingIndicator(name: context.localizations.departures);
    }
  }

  List<Widget> _departureList(DateTime? lastFetched) {
    return [
      if (lastFetched != null) LastUpdatedText(lastFetched),
      Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(
              context.localizations.line,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 7.5)),
          Text(
            context.localizations.direction,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            context.localizations.departure,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
      const Divider(),
      Expanded(
        child: RefreshIndicator(
          onRefresh: () {
            return ref.read(departureViewModel).fetch(true);
          },
          child: ListView.separated(
            itemBuilder: (context, index) => DeparturesDetailsRowView(
              departure: widget.snapshot.data![index],
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: widget.snapshot.data!.length,
          ),
        ),
      ),
    ];
  }
}
