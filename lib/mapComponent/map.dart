import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesWidget extends StatelessWidget {
  const PlacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const MapWidget(),
      DraggableScrollableSheet(
        minChildSize: 0.1,
        maxChildSize: 0.9,
        initialChildSize: 0.4,
        snapSizes: const [0.1, 0.4, 0.9],
        snap: true,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            color: Theme.of(context).canvasColor,
            child: ListView.builder(
              controller: scrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('Item $index'));
              },
            ),
          );
        },
      )
    ]);
  }
}

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<StatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> with WidgetsBindingObserver {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _defaultCameraPosition = CameraPosition(
    target: LatLng(48.135666124, 11.571831046),
    zoom: 14.4746,
  );

  final Set<Marker> _markers = {
    const Marker(
        markerId: MarkerId("mensaGarching"),
        position: LatLng(48.26819771128635, 11.672293040327283))
  };

  late String _darkMapStyle;
  late String _lightMapStyle;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadMapStyles();
    _setMapStyle();
  }

  Future _setMapStyle() async {
    final controller = await _controller.future;
    final theme = WidgetsBinding.instance.window.platformBrightness;
    if (theme == Brightness.dark) {
      controller.setMapStyle(_darkMapStyle);
    } else {
      controller.setMapStyle(_lightMapStyle);
    }
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {
      _setMapStyle();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future _loadMapStyles() async {
    _darkMapStyle =
    await rootBundle.loadString('assets/map_styles/darkMapTheme.json');
    _lightMapStyle =
    await rootBundle.loadString('assets/map_styles/lightMapTheme.json');
  }

  @override
  Widget build(BuildContext context) {
    /*determinePosition().then((value) async {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      )));
    });*/
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _defaultCameraPosition,
      rotateGesturesEnabled: false,
      compassEnabled: false,
      mapToolbarEnabled: false,
      tiltGesturesEnabled: false,
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: _markers,
    );
  }
}