import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/departuresComponent/model/departure.dart';
import 'package:campus_flutter/departuresComponent/model/station.dart';
import 'package:campus_flutter/departuresComponent/views/departuresDetailsRowView.dart';
import 'package:campus_flutter/departuresComponent/views/departuresDetailsView.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeparturesHomeWidget extends ConsumerStatefulWidget {
  const DeparturesHomeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DeparturesHomeWidgetState();
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
              title:  _titleBuilder(),
              child: GestureDetector(
                  onTap: () => _onWidgetPressed(context),
                  child: CardWithPadding(
                      height: MediaQuery.of(context).size.height * 0.21,
                      child: StreamBuilder(
                          stream: ref.watch(departureViewModel).departures,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final station =
                                  ref.watch(departureViewModel).selectedStation.value!;
                              return _widgetContent(snapshot, station);
                            } else if (snapshot.hasError) {
                              return ErrorHandlingView(
                                  error: snapshot.error!,
                                  errorHandlingViewType: ErrorHandlingViewType.textOnly,
                                  retry: ref.read(departureViewModel).fetch
                              );
                            } else {
                              return const DelayedLoadingIndicator(name: "Departures");
                            }
                          }))
              )
          );
        }
    );
  }

  String _titleBuilder() {
    if (ref.watch(departureViewModel).closestCampus.value?.name != null) {
      return "Departures @ ${ref.watch(departureViewModel).closestCampus.value?.name}";
    } else {
      return "Departures";
    }
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
        builder: (context) => const DeparturesDetailsScaffold()
        ));
  }
}
