import 'dart:async';
import 'dart:developer';
import 'dart:math' show Point;

import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/placesComponent/model/maps/marker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:material_ui/material_ui.dart';

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
  static const String _markerSourceId = 'campus_markers_source';
  static const String _markerLayerId = 'campus_markers_layer';

  MapLibreMapController? _mapController;
  bool isMapVisible = false;
  bool _styleReady = false;
  bool _sourceAdded = false;
  int _styleGeneration = 0;
  int _markerRevision = 0;
  String? _selectedMarkerId;
  Future<void> _mapOperations = Future.value();

  final Set<String> _loadedImages = {};

  @override
  void didUpdateWidget(covariant MapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.markers != oldWidget.markers) {
      if (_selectedMarkerId != null &&
          !widget.markers.any((m) => m.id == _selectedMarkerId)) {
        _selectedMarkerId = null;
      }
      _scheduleMarkerUpdate();
    }
  }

  @override
  void dispose() {
    _styleGeneration++;
    _styleReady = false;
    _sourceAdded = false;
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
    final revision = ++_markerRevision;
    final controller = _mapController;
    if (!_styleReady || controller == null) return;
    unawaited(
      _enqueueMapOperation(controller, _styleGeneration, (isCurrent) async {
        if (revision != _markerRevision) return;
        await _syncMarkers(controller, isCurrent);
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
    return Stack(
      children: [
        MapLibreMap(
          styleString: "https://nav.tum.de/martin/style/navigatum-basemap.json",
          initialCameraPosition: CameraPosition(
            target: LatLng(
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
          dragEnabled: true,
          scrollGesturesEnabled: true,
          rotateGesturesEnabled: false,
          compassEnabled: false,
          tiltGesturesEnabled: false,
          zoomGesturesEnabled: true,
          myLocationEnabled: true,
          myLocationRenderMode: MyLocationRenderMode.compass,
          onMapCreated: (controller) {
            _styleGeneration++;
            _styleReady = false;
            _sourceAdded = false;
            _selectedMarkerId = null;
            _loadedImages.clear();
            _mapController = controller;
          },
          onStyleLoadedCallback: () => _onStyleLoaded(),
          onMapClick: (point, _) => _onMapClick(point),
          attributionButtonPosition: AttributionButtonPosition.bottomLeft,
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedOpacity(
              curve: Curves.fastOutSlowIn,
              opacity: isMapVisible ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: ColoredBox(color: context.theme.scaffoldBackgroundColor),
            ),
          ),
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
    );
  }

  Future<void> _onStyleLoaded() async {
    final controller = _mapController;
    if (controller == null) return;
    final generation = ++_styleGeneration;
    _styleReady = false;
    _sourceAdded = false;

    await _enqueueMapOperation(controller, generation, (isCurrent) async {
      try {
        _loadedImages.clear();
        await _loadMarkerImages(controller, isCurrent);
        if (!isCurrent()) return;

        final markerRevision = _markerRevision;
        await controller.addGeoJsonSource(
          _markerSourceId,
          _buildMarkerFeatureCollection(),
        );
        if (!isCurrent()) return;

        await controller.addSymbolLayer(
          _markerSourceId,
          _markerLayerId,
          const SymbolLayerProperties(
            iconImage: ['get', 'iconImage'],
            iconSize: 3.0,
            iconRotate: ['get', 'iconRotate'],
            iconOffset: [0.0, -5.0],
            iconOpacity: ['get', 'iconOpacity'],
            iconAllowOverlap: true,
            iconIgnorePlacement: true,
            iconPadding: 0.0,
            symbolSortKey: ['get', 'zIndex'],
            textField: ['get', 'title'],
            textOffset: [0.0, -3.0],
            textColor: '#000000',
            textHaloColor: '#FFFFFF',
            textHaloWidth: 3.0,
            textHaloBlur: 0.0,
            textOpacity: ['get', 'textOpacity'],
            textMaxWidth: 100.0,
            textAllowOverlap: true,
            textIgnorePlacement: true,
            textOptional: true,
          ),
          enableInteraction: false,
        );
        if (!isCurrent()) return;

        _sourceAdded = true;
        _styleReady = true;

        if (_markerRevision != markerRevision) {
          await _syncMarkers(controller, isCurrent);
        }
      } finally {
        if (isCurrent() && !isMapVisible) {
          setState(() => isMapVisible = true);
        }
      }
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
        await controller.addImage(
          name,
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        );
        if (isCurrent()) _loadedImages.add(name);
      } catch (e) {
        log("Error loading map asset $path: $e");
      }
    }

    await load("pin_blue", "assets/images/map/pin_blue.webp");
    await load("pin_red", "assets/images/map/pin_red.webp");
  }

  Map<String, dynamic> _buildMarkerFeatureCollection() {
    return {
      'type': 'FeatureCollection',
      'features': [
        for (final marker in widget.markers)
          {
            'type': 'Feature',
            'id': marker.id,
            'geometry': {
              'type': 'Point',
              'coordinates': [
                marker.position.longitude,
                marker.position.latitude,
              ],
            },
            'properties': {
              'id': marker.id,
              'iconImage': marker.isRed ? 'pin_red' : 'pin_blue',
              'iconRotate': marker.rotation ?? 0.0,
              'iconOpacity': marker.alpha ?? 1.0,
              'zIndex': (marker.zIndex ?? 0).toDouble(),
              'title': marker.id == _selectedMarkerId
                  ? (marker.infoWindow?.title ?? '')
                  : '',
              'textOpacity': marker.id == _selectedMarkerId ? 1.0 : 0.0,
            },
          },
      ],
    };
  }

  Future<void> _syncMarkers(
    MapLibreMapController controller,
    bool Function() isCurrent,
  ) async {
    if (!isCurrent() || !_sourceAdded) return;
    await controller.setGeoJsonSource(
      _markerSourceId,
      _buildMarkerFeatureCollection(),
    );
  }

  void _onMapClick(Point<double> point) {
    final controller = _mapController;
    if (!_styleReady || !_sourceAdded || controller == null) return;

    unawaited(
      _enqueueMapOperation(controller, _styleGeneration, (isCurrent) async {
        final hitRect = Rect.fromCenter(
          center: Offset(point.x, point.y),
          width: 44,
          height: 44,
        );
        final features = await controller.queryRenderedFeaturesInRect(
          hitRect,
          const [_markerLayerId],
          null,
        );
        if (!isCurrent()) return;

        if (features.isEmpty) {
          if (_selectedMarkerId != null) {
            _selectedMarkerId = null;
            await _syncMarkers(controller, isCurrent);
          }
          return;
        }

        final first = features.first;
        final props = first is Map ? first['properties'] : null;
        final markerId = props is Map ? props['id']?.toString() : null;
        if (markerId == null) return;

        final marker = widget.markers
            .where((m) => m.id == markerId)
            .firstOrNull;
        if (marker == null) return;

        final onTap = marker.infoWindow?.onTap;
        if (_selectedMarkerId == markerId && onTap is void Function()) {
          onTap();
          return;
        }

        _selectedMarkerId = markerId;
        await _syncMarkers(controller, isCurrent);

        if (isCurrent()) {
          await controller.animateCamera(
            CameraUpdate.newLatLng(
              LatLng(marker.position.latitude, marker.position.longitude),
            ),
            duration: const Duration(seconds: 1),
          );
        }
      }),
    );
  }

  Future<void> _onLocateMePressed() async {
    final controller = _mapController;
    if (!_styleReady || controller == null) return;
    await _enqueueMapOperation(controller, _styleGeneration, (isCurrent) async {
      final myLoc = await controller.requestMyLocationLatLng();
      if (!isCurrent()) return;

      final target = myLoc != null
          ? LatLng(myLoc.latitude, myLoc.longitude)
          : const LatLng(48.26307794976663, 11.668018668778569);

      await controller.animateCamera(
        CameraUpdate.newLatLng(target),
        duration: const Duration(seconds: 1),
      );
    });
  }
}
