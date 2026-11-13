import 'dart:async';
import 'dart:developer';

import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/placesComponent/model/maps/marker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

class MapWidget extends ConsumerStatefulWidget {
  factory MapWidget.fullPadding({
    required Set<Marker> markers,
    LatLng? latLng,
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
      aspectRatioNeeded: aspectRatioNeeded,
      roundedCorners: roundedCorners,
      mapLegend: mapLegend,
    );
  }

  factory MapWidget.noPadding({
    required Set<Marker> markers,
    LatLng? latLng,
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
      aspectRatioNeeded: aspectRatioNeeded,
      roundedCorners: roundedCorners,
      mapLegend: mapLegend,
    );
  }

  factory MapWidget.customPadding({
    required Set<Marker> markers,
    required EdgeInsets padding,
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
  final Widget? mapLegend;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends ConsumerState<MapWidget> {
  MapLibreMapController? _mapController;
  bool isMapVisible = false;
  bool _styleReady = false;
  int _styleGeneration = 0;
  int _markerRevision = 0;
  Future<void> _mapOperations = Future.value();

  final Set<String> _loadedImages = {};

  @override
  void didUpdateWidget(covariant MapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.markers != oldWidget.markers) {
      _scheduleMarkerUpdate();
    }
  }

  @override
  void dispose() {
    _styleGeneration++;
    _styleReady = false;
    _mapController = null;
    super.dispose();
  }

  Future<void> _enqueueMapOperation(
    MapLibreMapController controller,
    int generation,
    Future<void> Function(bool Function() isCurrent) action,
  ) {
    bool isCurrent() =>
        mounted &&
        identical(controller, _mapController) &&
        generation == _styleGeneration;

    // Annotation layer rebuilds, marker replacement, and taps must not race.
    _mapOperations = _mapOperations
        .then((_) async {
          if (isCurrent()) await action(isCurrent);
        })
        .catchError((Object error, StackTrace stack) {
          if (isCurrent()) {
            log('Map update failed', error: error, stackTrace: stack);
          }
        });
    return _mapOperations;
  }

  void _scheduleMarkerUpdate() {
    final controller = _mapController;
    if (!_styleReady || controller == null) return;
    final revision = ++_markerRevision;
    unawaited(
      _enqueueMapOperation(controller, _styleGeneration, (isCurrent) async {
        if (revision != _markerRevision) return;
        await _updateMarkers(
          controller,
          () => isCurrent() && revision == _markerRevision,
        );
      }),
    );
  }

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
                child: _buildMapStack(),
              )
            : _buildMapStack(),
      ),
    );
  }

  Widget _buildMapStack() {
    return AnimatedOpacity(
      curve: Curves.fastOutSlowIn,
      opacity: isMapVisible ? 1.0 : 0.01,
      duration: const Duration(milliseconds: 200),
      child: Stack(
        children: [
          MapLibreMap(
            styleString:
                "https://nav.tum.de/martin/style/navigatum-basemap.json",
            initialCameraPosition: CameraPosition(
              target:
                  // mapLibre and Google Maps have different latLng classes. This converts between them and also provides a default location. - Nathan
                  LatLng(
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
            myLocationRenderMode: MyLocationRenderMode.compass,
            onMapCreated: (controller) {
              _styleGeneration++;
              _styleReady = false;
              _loadedImages.clear();
              _mapController = controller;
              _setupSymbolHandler(controller);
            },
            onStyleLoadedCallback: () => _onStyleLoaded(),
            attributionButtonPosition: AttributionButtonPosition.bottomLeft,
          ),

          if (widget.mapLegend != null)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(context.padding),
                child: widget.mapLegend!,
              ),
            ),

          Positioned(
            right: context.padding,
            bottom: context.padding,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              heroTag: "geolocation_button",
              backgroundColor: context.theme.cardColor,
              elevation: 6,
              onPressed: _onLocateMePressed,
              child: Image.asset(
                "assets/images/map/locate.webp",
                height: 36,
                width: 36,
                color: context.theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onStyleLoaded() async {
    final controller = _mapController;
    if (controller == null) return;
    final generation = ++_styleGeneration;
    _styleReady = false;
    await _enqueueMapOperation(controller, generation, (isCurrent) async {
      _loadedImages.clear();
      await _loadMarkerImages(controller, isCurrent);
      if (!isCurrent()) return;

      // These settings rebuild annotation layers; apply them once per style.
      await controller.symbolManager?.setIconAllowOverlap(true);
      if (!isCurrent()) return;
      await controller.symbolManager?.setIconIgnorePlacement(true);
      if (!isCurrent()) return;
      await controller.symbolManager?.setTextAllowOverlap(true);
      if (!isCurrent()) return;
      await controller.symbolManager?.setTextIgnorePlacement(true);
      if (!isCurrent()) return;

      _styleReady = true;
      await _updateMarkers(controller, isCurrent);
      if (isCurrent()) setState(() => isMapVisible = true);
    });
  }

  Future<void> _loadMarkerImages(
    MapLibreMapController controller,
    bool Function() isCurrent,
  ) async {
    Future<void> load(String name, String path) async {
      if (!isCurrent() || _loadedImages.contains(name)) return;
      try {
        final ByteData data = await rootBundle.load(path);
        if (!isCurrent()) return;
        await controller.addImage(name, data.buffer.asUint8List());
        if (isCurrent()) _loadedImages.add(name);
      } catch (e) {
        log("Error loading map asset $path: $e");
      }
    }

    await load("pin_blue", "assets/images/map/pin_blue.webp");
    await load("pin_red", "assets/images/map/pin_red.webp");
  }

  Future<void> _updateMarkers(
    MapLibreMapController controller,
    bool Function() isCurrent,
  ) async {
    if (!isCurrent()) return;
    await controller.clearSymbols();
    if (!isCurrent()) return;

    List<SymbolOptions> options = [];
    List<Map<String, dynamic>> data = [];

    for (var marker in widget.markers) {
      options.add(
        SymbolOptions(
          iconSize: 3,
          iconImage: marker.isRed ? "pin_red" : "pin_blue",
          iconRotate: marker.rotation,
          iconOffset: const Offset(0, -5),
          textField: marker.infoWindow?.title,
          textOffset: const Offset(0, -3),
          iconOpacity: marker.alpha,
          geometry: LatLng(marker.position.latitude, marker.position.longitude),
          zIndex: marker.zIndex,
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

      // Symbol data becomes GeoJSON; callbacks must stay on the Dart marker.
      data.add({"id": marker.id});
    }

    for (int i = 0; i < options.length; i++) {
      if (!isCurrent()) return;
      await controller.addSymbol(options[i], data[i]);
    }
  }

  void _setupSymbolHandler(MapLibreMapController controller) {
    controller.onSymbolTapped.add((symbol) {
      if (!_styleReady) return;
      unawaited(
        _enqueueMapOperation(controller, _styleGeneration, (isCurrent) async {
          if (!controller.symbols.contains(symbol)) return;
          // display text on tapped symbol & remove text from other symbols
          // if text is already displayed and item has onTap callback, callback is executed
          final markerId = symbol.data?["id"];
          final onTap = widget.markers
              .where((marker) => marker.id == markerId)
              .firstOrNull
              ?.infoWindow
              ?.onTap;

          if (symbol.options.textOpacity == 1 && onTap is void Function()) {
            onTap();
            return;
          }

          for (var s in controller.symbols.toList()) {
            if (!isCurrent()) return;
            if (s.options.textOpacity == 1) {
              await controller.updateSymbol(
                s,
                const SymbolOptions(textOpacity: 0),
              );
            }
          }

          if (!isCurrent()) return;
          await controller.updateSymbol(
            symbol,
            const SymbolOptions(textOpacity: 1),
          );

          if (isCurrent() && symbol.options.geometry != null) {
            await controller.animateCamera(
              CameraUpdate.newLatLng(
                symbol.options.geometry!,
              ), // something will have gone very wrong if it goes to 0,0
              duration: const Duration(seconds: 1), // magic number (felt right)
            );
          }
        }),
      );
    });
  }

  Future<void> _onLocateMePressed() async {
    final controller = _mapController;
    if (!_styleReady || controller == null) return;
    await _enqueueMapOperation(controller, _styleGeneration, (isCurrent) async {
      final myLoc = await controller.requestMyLocationLatLng();
      if (!isCurrent()) return;

      final target = myLoc != null
          ? LatLng(myLoc.latitude, myLoc.longitude)
          : const LatLng(
              48.26307794976663,
              11.668018668778569,
            ); // Default to TUM Garching campus

      await controller.animateCamera(
        CameraUpdate.newLatLng(target),
        duration: const Duration(seconds: 1),
      );
    });
  }
}
