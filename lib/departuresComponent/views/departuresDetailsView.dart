import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/departuresComponent/model/departure.dart';
import 'package:campus_flutter/departuresComponent/model/station.dart';
import 'package:campus_flutter/departuresComponent/views/departuresDetailsRowView.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeparturesDetailsScaffold extends ConsumerWidget {
  const DeparturesDetailsScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
        stream: ref.watch(departureViewModel).departures,
        builder: (context, snapshot) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: const BackButton(),
                title:
                    Text(ref.watch(departureViewModel).selectedStation.value?.name ?? "Departures"),
                actions: [
                  PopupMenuButton<Station>(
                    surfaceTintColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    initialValue: ref.watch(departureViewModel).selectedStation.value,
                    onSelected: (station) {
                      ref.read(departureViewModel).setSelectedStation(station);
                      ref.read(departureViewModel).fetchDepartures();
                    },
                    icon: const Icon(Icons.tram),
                    itemBuilder: (context) => ref.read(departureViewModel).getMenuEntries(),
                  )
                ],
              ),
              body: DeparturesDetailsView(snapshot: snapshot));
        });
  }
}

class DeparturesDetailsView extends ConsumerStatefulWidget {
  const DeparturesDetailsView({super.key, required this.snapshot});

  final AsyncSnapshot<List<Departure>?> snapshot;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DeparturesDetailsViewState();
}

class _DeparturesDetailsViewState extends ConsumerState<DeparturesDetailsView> {
  @override
  Widget build(BuildContext context) {
    if (widget.snapshot.hasData) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ref.watch(departureViewModel).selectedStation.value != null) ...[
                Text.rich(TextSpan(text: "Station: ", children: [
                  TextSpan(
                      text: ref.watch(departureViewModel).selectedStation.value!.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor))
                ]))
              ],
              const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              const Row(
                children: [
                  SizedBox(width: 50, child: Text("Line")),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 7.5)),
                  Text("Direction"),
                  Spacer(),
                  Text("Departure")
                ],
              ),
              const Divider(),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          DeparturesDetailsRowView(departure: widget.snapshot.data![index]),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: widget.snapshot.data!.length)),
            ],
          ));
    } else if (widget.snapshot.hasError) {
      return const Text("Error");
    } else {
      return const DelayedLoadingIndicator(name: "Departures");
    }
  }
}
