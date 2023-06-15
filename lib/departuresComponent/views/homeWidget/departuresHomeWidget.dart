import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/departuresComponent/model/departure.dart';
import 'package:campus_flutter/departuresComponent/model/station.dart';
import 'package:campus_flutter/departuresComponent/viewModel/departuresViewModel.dart';
import 'package:campus_flutter/departuresComponent/views/departuresDetailsRowView.dart';
import 'package:campus_flutter/departuresComponent/views/departuresDetailsView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO: stateless?
class DeparturesHomeWidget extends StatefulWidget {
  const DeparturesHomeWidget({super.key});

  @override
  State<StatefulWidget> createState() => _DeparturesHomeWidgetState();
}

class _DeparturesHomeWidgetState extends State<DeparturesHomeWidget> {
  @override
  void deactivate() {
    Provider.of<DeparturesViewModel>(context, listen: false).timer?.cancel();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return CardWithPadding(
        height: MediaQuery.of(context).size.height * 0.21,
        child: StreamBuilder(
            stream: Provider.of<DeparturesViewModel>(context, listen: true).departures,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final station =
                    Provider.of<DeparturesViewModel>(context, listen: true).selectedStation.value!;
                return MaterialButton(
                    onPressed: () => _onWidgetPressed(context),
                    child: _widgetContent(snapshot, station)
                );
              } else if (snapshot.hasError) {
                return const Text("Error");
              } else {
                return const DelayedLoadingIndicator(name: "Departures");
              }
            }));
  }

  Widget _widgetContent(AsyncSnapshot<List<Departure>?> snapshot, Station station) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
          text:
              TextSpan(text: "Station: ", style: Theme.of(context).textTheme.bodyMedium, children: [
        TextSpan(
            text: station.name,
            style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold))
      ])),
      for (var departure in snapshot.data!.getRange(0, 3)) ...[
        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        DeparturesDetailsRowView(departure: departure)
      ]
    ]);
  }

  _onWidgetPressed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (newContext) => Provider<DeparturesViewModel>.value(
            value: Provider.of<DeparturesViewModel>(context),
            child: const DeparturesDetailsScaffold()
        )));
  }
}
