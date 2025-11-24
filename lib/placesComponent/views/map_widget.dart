import 'dart:async';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            styleString: "https://nav.tum.de/martin/style/navigatum-basemap.json",
            initialCameraPosition: maplibre.CameraPosition(
              target:
                  // mapLibre and Google Maps have different latLng classes. This converts between them and also provides a default location. - Nathan
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
            tiltGesturesEnabled: false,
            zoomGesturesEnabled: true,
            myLocationEnabled: true,
            myLocationRenderMode: maplibre.MyLocationRenderMode.compass,
            onMapCreated: (maplibre.MapLibreMapController controller) {
              _controller.complete(controller);
            },

            onStyleLoadedCallback: () => {
              _controller.future.then((controller) async {
                final ByteData pinData = await rootBundle.load("assets/images/map/pin.webp");
                controller.addImage("pin", pinData.buffer.asUint8List());
                controller.symbolManager?.setIconAllowOverlap(true);
                controller.symbolManager?.setIconIgnorePlacement(true);
                controller.symbolManager?.setTextAllowOverlap(true);
                controller.symbolManager?.setTextIgnorePlacement(true);

                for (var marker in widget.markers) {
                  controller.addSymbol(
                    maplibre.SymbolOptions(
                      iconSize: 3,
                      iconImage: "pin", // Theoretically this could be set based on the marker ID. But in the current app it's always the same anyway.
                      iconRotate: marker.rotation,
                      iconOffset: Offset(0, -5),
                      textField: marker.infoWindow.title,
                      textOffset: Offset(0, -3),
                      iconOpacity: marker.alpha,
                      geometry: maplibre.LatLng(
                        marker.position.latitude,
                        marker.position.longitude,
                      ),
                      zIndex: marker.zIndexInt,
                      draggable: marker.draggable,
                      fontNames: ["Roboto Regular"],
                      textColor: "#000000",
                      textHaloColor: "#FFFFFF",
                      textHaloWidth: 3.0, // magic number (done by eye)
                      textHaloBlur: 0,
                      textOpacity: 0, // Starts hidden (handled on tap)
                      textMaxWidth: -1, // No limit
                    ),
                  );
                }

                controller.onSymbolTapped.add((symbol) {
                  // display text on tapped symbol & remove text from other symbols
                  for (var symbol in controller.symbols) {
                    controller.updateSymbol(
                      symbol,
                      maplibre.SymbolOptions(textOpacity: 0),
                    );
                  }
                  controller.updateSymbol(
                    symbol,
                    maplibre.SymbolOptions(textOpacity: 1),
                  );
                  controller.moveCamera(maplibre.CameraUpdate.newLatLng(symbol.options.geometry ?? maplibre.LatLng(0, 0))); // something will have gone very wrong if it goes to 0,0
                });

                if (mounted) {
                  setState(() {
                    isMapVisible = true;
                  });
                }
              }),
            },
          ),
          if (widget.mapLegend != null)
            Padding(
              padding: EdgeInsets.all(context.padding),
              child: widget.mapLegend!,
            ),
          Positioned(
            top: 10,
            left: 10,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: "geolocation_button",
              onPressed: () {
                _controller.future.then((controller) {
                  controller.requestMyLocationLatLng().then((latlng) => {
                    controller.moveCamera(
                    maplibre.CameraUpdate.newLatLng(
                      maplibre.LatLng(
                        // Default to TUM Garching campus
                        latlng?.latitude ?? 48.26307794976663,
                        latlng?.longitude ?? 11.668018668778569,
                      ),
                    ),
                  )});
                });
              },
              backgroundColor: Colors.white,
              elevation: 2e31, 
              child: Image.asset(
                  "assets/images/map/locate.webp",
                  height: 36,
                  width: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
