import 'dart:async';
import 'dart:js_interop';
import 'package:campus_flutter/placesComponent/services/map_theme_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maplibre_gl/maplibre_gl.dart' as maplibre;

class MapWidget extends ConsumerStatefulWidget {
  factory MapWidget.fullPadding({
    required Set<Marker> markers,
    LatLng? latLng,
    EdgeInsets? controlPadding,
    double? zoom,
    double? aspectRatio,
    bool aspectRatioNeeded = true,
    bool roundedCorners = true,
    Widget? mapLegend,
  }) {
    return MapWidget._(
      markers: markers,
      controlPadding: controlPadding,
      latLng: latLng,
      zoom: zoom,
      aspectRatio: aspectRatio,
      aspectRatioNeeded: aspectRatioNeeded,
      roundedCorners: roundedCorners,
      mapLegend: mapLegend,
    );
  }

  factory MapWidget.noPadding({
    required Set<Marker> markers,
    LatLng? latLng,
    EdgeInsets? controlPadding,
    double? zoom,
    double? aspectRatio,
    bool aspectRatioNeeded = true,
    bool roundedCorners = true,
    Widget? mapLegend,
  }) {
    return MapWidget._(
      markers: markers,
      latLng: latLng,
      zoom: zoom,
      aspectRatio: aspectRatio,
      padding: EdgeInsets.zero,
      controlPadding: controlPadding,
      aspectRatioNeeded: aspectRatioNeeded,
      roundedCorners: roundedCorners,
      mapLegend: mapLegend,
    );
  }

  factory MapWidget.customPadding({
    required Set<Marker> markers,
    required EdgeInsets padding,
    EdgeInsets? controlPadding,
    LatLng? latLng,
    double? zoom,
    double? aspectRatio,
    bool aspectRatioNeeded = true,
    bool roundedCorners = true,
    Widget? mapLegend,
  }) {
    return MapWidget._(
      markers: markers,
      padding: padding,
      controlPadding: controlPadding,
      latLng: latLng,
      zoom: zoom,
      aspectRatio: aspectRatio,
      aspectRatioNeeded: aspectRatioNeeded,
      roundedCorners: roundedCorners,
      mapLegend: mapLegend,
    );
  }

  const MapWidget._({
    required this.markers,
    this.latLng,
    this.zoom,
    this.aspectRatio,
    this.padding,
    this.controlPadding,
    required this.aspectRatioNeeded,
    required this.roundedCorners,
    this.mapLegend,
  });

  final Set<Marker> markers;
  final LatLng? latLng;
  final double? zoom;
  final double? aspectRatio;
  final bool aspectRatioNeeded;
  final bool roundedCorners;
  final EdgeInsets? padding;
  final EdgeInsets? controlPadding;
  final Widget? mapLegend;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends ConsumerState<MapWidget> {
  late final Completer<maplibre.MapLibreMapController> _controller =
      Completer<maplibre.MapLibreMapController>();

  bool isMapVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          widget.padding ??
          EdgeInsets.only(
            left: context.padding,
            right: context.padding,
            bottom: context.padding,
            top: context.halfPadding,
          ),
      child: ClipRRect(
        borderRadius: widget.roundedCorners
            ? BorderRadius.circular(15.0)
            : BorderRadius.zero,
        child: widget.aspectRatioNeeded
            ? AspectRatio(
                aspectRatio: widget.aspectRatio ?? 1.0,
                child: _mapWidget(),
              )
            : _mapWidget(),
      ),
    );
  }

  Widget _mapWidget() {
    return AnimatedOpacity(
      curve: Curves.fastOutSlowIn,
      opacity: isMapVisible ? 1.0 : 0.01,
      duration: const Duration(milliseconds: 200),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          maplibre.MapLibreMap(
            styleString:
                "https://nav.tum.de/martin/style/navigatum-basemap.json",
            // mapType: MapType.normal,
            // padding: widget.controlPadding ?? EdgeInsets.zero,
            initialCameraPosition: maplibre.CameraPosition(
              target:
                  // mapLibre and Google Maps have different latLng classes. This converts between them and also provides a default location.
                  maplibre.LatLng(
                    widget.latLng?.latitude ?? 48.26307794976663,
                    widget.latLng?.longitude ?? 11.668018668778569,
                  ),
              zoom: widget.zoom ?? 10,
            ),
            gestureRecognizers: {
              Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer(),
              ),
            },
            rotateGesturesEnabled: false,
            compassEnabled: false,
            //mapToolbarEnabled: false,
            tiltGesturesEnabled: false,
            //zoomControlsEnabled: true,
            myLocationEnabled: true,
            //myLocationButtonEnabled: true,
            onMapCreated: (maplibre.MapLibreMapController controller) {
              _controller.complete(controller);
              Future.delayed(const Duration(milliseconds: 250), () {
                if (mounted) {
                  setState(() {
                    isMapVisible = true;
                  });
                }
              });
            },
            //replacement for "markers: widget.markers". I know, it's a bit longer.
            onStyleLoadedCallback: () => {
              _controller.future.then((controller) {
                for (var marker in widget.markers) {
                  controller.addImage(marker.icon.toString(), marker.icon as Uint8List);
                  controller.addSymbol(
                    maplibre.SymbolOptions(
                      //iconSize ?
                      iconImage: marker.icon.toString(),
                      iconRotate: marker.rotation,
                      iconOffset: marker.anchor,
                      //iconAnchor ?
                      textField: marker.infoWindow.title,
                      //textSize ?
                      //textAnchor ?
                      textOffset: marker.infoWindow.anchor,
                      iconOpacity: marker.alpha,
                      geometry: maplibre.LatLng(
                        marker.position.latitude,
                        marker.position.longitude,
                      ),
                    ),
                  );
                }
              }),
            },
          ),
          if (widget.mapLegend != null)
            Padding(
              padding: EdgeInsets.all(context.padding),
              child: widget.mapLegend!,
            ),
        ],
      ),
    );
  }
}
