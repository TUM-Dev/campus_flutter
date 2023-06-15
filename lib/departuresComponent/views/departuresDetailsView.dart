import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/departuresComponent/model/station.dart';
import 'package:campus_flutter/departuresComponent/viewModel/departuresViewModel.dart';
import 'package:campus_flutter/departuresComponent/views/departuresDetailsRowView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeparturesDetailsScaffold extends StatelessWidget {
  const DeparturesDetailsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
            leading: const BackButton(),
            title: Text(Provider
                .of<DeparturesViewModel>(context)
                .selectedStation
                .value
                ?.name ?? "Departures"),
        actions: [
          PopupMenuButton<Station>(
            surfaceTintColor: Colors.transparent,
              initialValue: Provider.of<DeparturesViewModel>(context).selectedStation.value,
              onSelected: (station) {
                Provider.of<DeparturesViewModel>(context, listen: false).setSelectedStation(station);
                Provider.of<DeparturesViewModel>(context, listen: false).fetchDepartures();
              },
              icon: const Icon(Icons.tram),
              itemBuilder: (context) => Provider.of<DeparturesViewModel>(context, listen: false).getMenuEntries()
          )
        ],
        ),
        body: const DeparturesDetailsView());
  }
}

class DeparturesDetailsView extends StatelessWidget {
  const DeparturesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<DeparturesViewModel>(context).departures,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                    SizedBox(width: 50, child: Text("Line")),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
                    Text("Direction"),
                    Spacer(),
                    Text("Departure")
                      ],
                    ),
                    const Divider(),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                      children: [
                        for (var departure in snapshot.data!) ...[
                          DeparturesDetailsRowView(departure: departure),
                          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0))
                        ]
                      ],
                    ))),
                  ],
                ));
          } else if (snapshot.hasError) {
            return const Text("Error");
          } else {
            return const DelayedLoadingIndicator(name: "Departures");
          }
        });
  }
}
