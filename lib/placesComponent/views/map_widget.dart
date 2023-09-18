import 'dart:async';
import 'package:campus_flutter/placesComponent/services/mapThemeService.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  factory MapWidget.fullPadding(
      {required Set<Marker> markers,
      LatLng? latLng,
      double? zoom,
      double? aspectRatio,
      bool aspectRatioNeeded = true}) {
    return MapWidget(
      markers: markers,
      horizontalPadding: false,
      latLng: latLng,
      zoom: zoom,
      aspectRatio: aspectRatio,
      aspectRatioNeeded: aspectRatioNeeded,
    );
  }

  factory MapWidget.horizontalPadding(
      {required Set<Marker> markers,
      LatLng? latLng,
      double? zoom,
      double? aspectRatio,
      bool aspectRatioNeeded = true}) {
    return MapWidget(
      markers: markers,
      latLng: latLng,
      zoom: zoom,
      aspectRatio: aspectRatio,
      horizontalPadding: true,
      aspectRatioNeeded: aspectRatioNeeded,
    );
  }

  factory MapWidget.noPadding(
      {required Set<Marker> markers,
      LatLng? latLng,
      double? zoom,
      double? aspectRatio,
      bool aspectRatioNeeded = true}) {
    return MapWidget(
      markers: markers,
      latLng: latLng,
      zoom: zoom,
      aspectRatio: aspectRatio,
      horizontalPadding: false,
      padding: EdgeInsets.zero,
      aspectRatioNeeded: aspectRatioNeeded,
    );
  }

  factory MapWidget.customPadding(
      {required Set<Marker> markers,
      required EdgeInsets padding,
      LatLng? latLng,
      double? zoom,
      double? aspectRatio,
      bool aspectRatioNeeded = true}) {
    return MapWidget(
      markers: markers,
      padding: padding,
      latLng: latLng,
      zoom: zoom,
      aspectRatio: aspectRatio,
      horizontalPadding: false,
      aspectRatioNeeded: aspectRatioNeeded,
    );
  }

  const MapWidget(
      {super.key,
      required this.markers,
      required this.horizontalPadding,
      this.latLng,
      this.zoom,
      this.aspectRatio,
      this.padding,
      this.aspectRatioNeeded = true});

  final Set<Marker> markers;
  final bool horizontalPadding;
  final LatLng? latLng;
  final double? zoom;
  final double? aspectRatio;
  final bool aspectRatioNeeded;
  final EdgeInsets? padding;

  @override
  State<StatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> with WidgetsBindingObserver {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  bool isMapVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _setMapStyle();
  }

  Future _setMapStyle() async {
    final controller = await _controller.future;
    final theme = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    if (theme == Brightness.dark) {
      controller.setMapStyle(getIt.get<MapThemeService>().darkTheme);
    } else {
      controller.setMapStyle(getIt.get<MapThemeService>().lightTheme);
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.all(context.padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: widget.aspectRatioNeeded
            ? AspectRatio(
                aspectRatio: widget.aspectRatio ?? 1.0, child: _mapWidget())
            : _mapWidget(),
      ),
    );
  }

  Widget _mapWidget() {
    return AnimatedOpacity(
        curve: Curves.fastOutSlowIn,
        opacity: isMapVisible ? 1.0 : 0.01,
        duration: const Duration(milliseconds: 200),
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target: widget.latLng ??
                  const LatLng(48.26307794976663, 11.668018668778569),
              zoom: widget.zoom ?? 10),
          gestureRecognizers: {
            Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer())
          },
          rotateGesturesEnabled: false,
          compassEnabled: false,
          mapToolbarEnabled: false,
          tiltGesturesEnabled: false,
          zoomControlsEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          markers: widget.markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            Future.delayed(
                const Duration(milliseconds: 250),
                () => setState(() {
                      isMapVisible = true;
                    }));
          },
        ));
    /*return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
          target: widget.latLng ??
              const LatLng(48.26307794976663, 11.668018668778569),
          zoom: widget.zoom ?? 10),
      gestureRecognizers: {
        Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())
      },
      rotateGesturesEnabled: false,
      compassEnabled: false,
      mapToolbarEnabled: false,
      tiltGesturesEnabled: false,
      zoomControlsEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: widget.markers,
    );*/
  }
}
