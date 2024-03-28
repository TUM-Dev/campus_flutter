import 'package:campus_flutter/base/classes/location.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

class RelaxationsScaffold extends StatelessWidget {
  const RelaxationsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("#TUMalChillen"),
      ),
      body: const RelaxationsView(),
    );
  }
}

class RelaxationsView extends StatelessWidget {
  const RelaxationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MapWidget.fullPadding(
            markers: relaxationPlaces
                .map(
                  (e) => Marker(
                    markerId: MarkerId(const Uuid().v4()),
                    position: LatLng(e.location.latitude, e.location.longitude),
                    icon: BitmapDescriptor.defaultMarkerWithHue(208),
                    infoWindow: InfoWindow(
                      title: e.name,
                      snippet: "Test",
                      onTap: () {},
                    ),
                  ),
                )
                .toSet(),
          ),
          const PaddedDivider(),
          WidgetFrameView(
            title: "Relaxation Places",
            child: Card(
              child: SeparatedList.list(
                data: relaxationPlaces,
                tile: (cafeteria) => ListTile(
                  title: Text(cafeteria.name),
                  onTap: () => context.push(relaxationPlace),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static List<RelaxationPlace> get relaxationPlaces => [
        RelaxationPlace(
          name:
              "Bänke im Gebäude der Fakultät für Elektro- und Informationstechnik",
          location: Location(latitude: 48.150297, longitude: 11.568303),
          relaxationType: RelaxationType.indoor,
        ),
        RelaxationPlace(
          name: "Gebäude Lehrstuhl Massivbau",
          location: Location(latitude: 11.568303, longitude: 48.150297),
          relaxationType: RelaxationType.indoor,
        ),
        RelaxationPlace(
          name:
              "Bänke im Gebäude der Fakultät für Elektro- und Informationstechnik",
          location: Location(latitude: 11.568303, longitude: 48.150297),
          relaxationType: RelaxationType.indoor,
        ),
        RelaxationPlace(
          name:
              "Bänke im Gebäude der Fakultät für Elektro- und Informationstechnik",
          location: Location(latitude: 11.568303, longitude: 48.150297),
          relaxationType: RelaxationType.indoor,
        ),
        RelaxationPlace(
          name:
              "Bänke im Gebäude der Fakultät für Elektro- und Informationstechnik",
          location: Location(latitude: 11.568303, longitude: 48.150297),
          relaxationType: RelaxationType.indoor,
        ),
        RelaxationPlace(
          name:
              "Bänke im Gebäude der Fakultät für Elektro- und Informationstechnik",
          location: Location(latitude: 11.568303, longitude: 48.150297),
          relaxationType: RelaxationType.indoor,
        ),
        RelaxationPlace(
          name:
              "Bänke im Gebäude der Fakultät für Elektro- und Informationstechnik",
          location: Location(latitude: 11.568303, longitude: 48.150297),
          relaxationType: RelaxationType.indoor,
        ),
        RelaxationPlace(
          name:
              "Bänke im Gebäude der Fakultät für Elektro- und Informationstechnik",
          location: Location(latitude: 11.568303, longitude: 48.150297),
          relaxationType: RelaxationType.indoor,
        ),
        RelaxationPlace(
          name:
              "Bänke im Gebäude der Fakultät für Elektro- und Informationstechnik",
          location: Location(latitude: 11.568303, longitude: 48.150297),
          relaxationType: RelaxationType.indoor,
        ),
      ];
}

class RelaxationPlace {
  final String name;
  final Location location;
  final RelaxationType relaxationType;

  //final String imageUrl;

  RelaxationPlace({
    required this.name,
    required this.location,
    required this.relaxationType,
    //required this.imageUrl,
  });
}

enum RelaxationType {
  indoor,
  outdoor;
}
