import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/last_updated_text.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/departuresComponent/model/departure.dart';
import 'package:campus_flutter/departuresComponent/model/station.dart';
import 'package:campus_flutter/departuresComponent/views/departures_details_row_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_launcher/map_launcher.dart';

class DeparturesDetailsScaffold extends ConsumerWidget {
  const DeparturesDetailsScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
        stream: ref.watch(departureViewModel).departures,
        builder: (context, snapshot) {
          final backgroundColor = MediaQuery.platformBrightnessOf(context) == Brightness.dark
              ? Theme.of(context).canvasColor
              : Colors.white;
          return Scaffold(
              appBar: AppBar(
                leading: const BackButton(),
                backgroundColor: backgroundColor,
                title: Text(
                    ref.watch(departureViewModel).selectedStation.value?.name ??
                        "Departures"),
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
                        ref.read(departureViewModel).getMenuEntries(),
                  )
                ],
              ),
              backgroundColor: backgroundColor,
              body: DeparturesDetailsView(snapshot: snapshot));
        });
  }
}

class DeparturesDetailsView extends ConsumerStatefulWidget {
  const DeparturesDetailsView({super.key, required this.snapshot});

  final AsyncSnapshot<List<Departure>?> snapshot;

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
                Text.rich(TextSpan(text: "Station: ", children: [
                  TextSpan(
                      text: ref
                          .watch(departureViewModel)
                          .selectedStation
                          .value!
                          .name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor))
                ])),
                GestureDetector(
                    onTap: () async {
                      Station? selectedStation =
                          ref.read(departureViewModel).selectedStation.value;
                      if (selectedStation != null && selectedStation.location != null) {
                        if (await MapLauncher.isMapAvailable(MapType.google) ??
                            false) {
                          await MapLauncher.showDirections(
                            mapType: MapType.google,
                            directionsMode: DirectionsMode.walking,
                            destinationTitle: selectedStation.name,
                            destination: Coords(
                                selectedStation.location!.latitude,
                                selectedStation.location!.longitude),
                          );
                        } else if (await MapLauncher.isMapAvailable(
                                MapType.apple) ??
                            false) {
                          await MapLauncher.showDirections(
                            mapType: MapType.apple,
                            directionsMode: DirectionsMode.walking,
                            destinationTitle: selectedStation.name,
                            destination: Coords(
                                selectedStation.location!.latitude,
                                selectedStation.location!.longitude),
                          );
                        }
                      }
                    },
                    child: const IconText(
                        iconData: Icons.open_in_new, label: "Show Directions"))
              ],
              const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              if (lastFetched != null) LastUpdatedText(lastFetched),
              const Row(
                children: [
                  SizedBox(
                      width: 50,
                      child: Text("Line",
                          style: TextStyle(fontWeight: FontWeight.w500))),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 7.5)),
                  Text("Direction",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  Spacer(),
                  Text("Departure",
                      style: TextStyle(fontWeight: FontWeight.w500))
                ],
              ),
              const Divider(),
              Expanded(
                  child: RefreshIndicator(
                      onRefresh: () {
                        return ref.read(departureViewModel).fetch(true);
                      },
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              DeparturesDetailsRowView(
                                  departure:
                                      widget.snapshot.data![index]),
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: widget.snapshot.data!.length))),
            ],
          ));
    } else if (widget.snapshot.hasError) {
      return ErrorHandlingView(
          error: widget.snapshot.error!,
          errorHandlingViewType: ErrorHandlingViewType.fullScreen,
          retry: ref.read(departureViewModel).fetch
      );
    } else {
      return const DelayedLoadingIndicator(name: "Departures");
    }
  }
}
