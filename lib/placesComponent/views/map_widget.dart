import 'dart:async';
import 'dart:developer';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/placesComponent/model/maps/marker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

  final Set<String> _loadedImages = {};

  @override
  void didUpdateWidget(covariant MapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_mapController != null && widget.markers != oldWidget.markers) {
      _updateMarkers(_mapController!);
    }
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

    await _loadMarkerImages(controller);
    _updateMarkers(controller);

    if (mounted) {
      setState(() {
        isMapVisible = true;
      });
    }
  }

  Future<void> _loadMarkerImages(MapLibreMapController controller) async {
    Future<void> load(String name, String path) async {
      if (_loadedImages.contains(name)) return;
      try {
        final ByteData data = await rootBundle.load(path);
        await controller.addImage(name, data.buffer.asUint8List());
        _loadedImages.add(name);
      } catch (e) {
        log("Error loading map asset $path: $e");
      }
    }

    await load("pin_blue", "assets/images/map/pin_blue.webp");
    await load("pin_red", "assets/images/map/pin_red.webp");
  }

  void _updateMarkers(MapLibreMapController controller) async {
    await controller.clearSymbols();

    await controller.symbolManager?.setIconAllowOverlap(true);
    await controller.symbolManager?.setIconIgnorePlacement(true);
    await controller.symbolManager?.setTextAllowOverlap(true);
    await controller.symbolManager?.setTextIgnorePlacement(true);

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

      data.add({"id": marker.id, "onTap": marker.infoWindow?.onTap});
    }

    for (int i = 0; i < options.length; i++) {
      await controller.addSymbol(options[i], data[i]);
    }
  }

  void _setupSymbolHandler(MapLibreMapController controller) {
    controller.onSymbolTapped.add((symbol) {
      // display text on tapped symbol & remove text from other symbols
      // if text is already displayed and item has onTap callback, callback is executed
      final onTap = symbol.data?["onTap"];

      if (symbol.options.textOpacity == 1 && onTap is void Function()) {
        onTap();
      }

      for (var s in controller.symbols) {
        if (s.options.textOpacity == 1) {
          controller.updateSymbol(s, const SymbolOptions(textOpacity: 0));
        }
      }

      controller.updateSymbol(symbol, const SymbolOptions(textOpacity: 1));

      if (symbol.options.geometry != null) {
        controller.animateCamera(
          CameraUpdate.newLatLng(
            symbol.options.geometry!,
          ), // something will have gone very wrong if it goes to 0,0
          duration: const Duration(seconds: 1), // magic number (felt right)
        );
      }
    });
  }

  void _onLocateMePressed() async {
    if (_mapController == null) return;

    final myLoc = await _mapController!.requestMyLocationLatLng();

    final target = myLoc != null
        ? LatLng(myLoc.latitude, myLoc.longitude)
        : const LatLng(
            48.26307794976663,
            11.668018668778569,
          ); // Default to TUM Garching campus

    _mapController!.animateCamera(
      CameraUpdate.newLatLng(target),
      duration: const Duration(seconds: 1),
    );
  }
}
