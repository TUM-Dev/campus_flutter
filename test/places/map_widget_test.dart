import 'dart:async';
import 'dart:convert';
import 'dart:math' show Point;

import 'package:campus_flutter/placesComponent/model/maps/marker.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maplibre_gl/maplibre_gl.dart' as maps;
import 'package:material_ui/material_ui.dart';

class _MapPlatform extends maps.MapLibrePlatform {
  @override
  Widget buildView(
    Map<String, dynamic> creationParams,
    maps.OnPlatformViewCreatedCallback onPlatformViewCreated,
    Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers,
  ) => const SizedBox();

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _MapController implements maps.MapLibreMapController {
  Completer<void>? imageGate;
  Completer<void>? setGeoJsonGate;
  bool failSetGeoJson = false;
  bool updating = false;
  int imageCalls = 0;
  int addGeoJsonCalls = 0;
  int setGeoJsonCalls = 0;
  int addSymbolLayerCalls = 0;
  int animateCameraCalls = 0;
  maps.SymbolLayerProperties? symbolLayerProperties;
  Map<String, dynamic>? geoJsonSource;
  List<dynamic>? queriedFeaturesOverride;

  List<Map<String, dynamic>> get features {
    final raw = geoJsonSource?['features'] as List<dynamic>?;
    if (raw == null) return const [];
    return raw.cast<Map<String, dynamic>>();
  }

  List<String> get markerIds => [
    for (final feature in features)
      (feature['properties'] as Map<String, dynamic>)['id'] as String,
  ];

  @override
  Future<void> addImage(
    String name,
    Uint8List bytes, [
    bool sdf = false,
    double? pixelRatio,
  ]) async {
    imageCalls++;
    await imageGate?.future;
  }

  @override
  Future<void> addGeoJsonSource(
    String sourceId,
    Map<String, dynamic> geojson, {
    String? promoteId,
  }) async {
    if (updating) throw StateError('Overlapping marker updates');
    addGeoJsonCalls++;
    // Exercise the same serialization boundary as MapLibre's GeoJSON source.
    geoJsonSource = jsonDecode(jsonEncode(geojson)) as Map<String, dynamic>;
  }

  @override
  Future<void> setGeoJsonSource(
    String sourceId,
    Map<String, dynamic> geojson,
  ) async {
    if (updating) throw StateError('Overlapping marker updates');
    if (failSetGeoJson) {
      failSetGeoJson = false;
      throw StateError('Style was replaced');
    }
    setGeoJsonCalls++;
    updating = true;
    final gate = setGeoJsonGate;
    setGeoJsonGate = null;
    try {
      await gate?.future;
      // Exercise the same serialization boundary as MapLibre's GeoJSON source.
      geoJsonSource = jsonDecode(jsonEncode(geojson)) as Map<String, dynamic>;
    } finally {
      updating = false;
    }
  }

  @override
  Future<void> addSymbolLayer(
    String sourceId,
    String layerId,
    maps.SymbolLayerProperties properties, {
    String? belowLayerId,
    String? sourceLayer,
    double? minzoom,
    double? maxzoom,
    dynamic filter,
    bool enableInteraction = true,
  }) async {
    addSymbolLayerCalls++;
    symbolLayerProperties = properties;
  }

  @override
  Future<List<dynamic>> queryRenderedFeaturesInRect(
    Rect rect,
    List<String> layerIds,
    String? filter,
  ) async => queriedFeaturesOverride ?? features;

  @override
  Future<bool?> animateCamera(
    maps.CameraUpdate cameraUpdate, {
    Duration? duration,
  }) async {
    animateCameraCalls++;
    return true;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  final originalFactory = maps.MapLibrePlatform.createInstance;
  setUp(() => maps.MapLibrePlatform.createInstance = _MapPlatform.new);
  tearDown(() => maps.MapLibrePlatform.createInstance = originalFactory);

  Marker marker(String id) => Marker(
    id: id,
    position: const maps.LatLng(48.26, 11.67),
    infoWindow: InfoWindow(title: id),
  );

  Future<maps.MapLibreMap> show(
    WidgetTester tester,
    Set<Marker> markers,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: MapWidget.noPadding(markers: markers)),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return tester.widget<maps.MapLibreMap>(find.byType(maps.MapLibreMap));
  }

  testWidgets('marker changes wait for style readiness and use latest data', (
    tester,
  ) async {
    final controller = _MapController();
    final map = await show(tester, {marker('old')});
    map.onMapCreated!(controller);
    await show(tester, {marker('latest')});
    expect(controller.addGeoJsonCalls, 0);
    expect(controller.setGeoJsonCalls, 0);
    expect(controller.features, isEmpty);

    map.onStyleLoadedCallback!();
    await tester.pumpAndSettle();
    expect(controller.addGeoJsonCalls, 1);
    expect(controller.addSymbolLayerCalls, 1);
    expect(controller.setGeoJsonCalls, 0);
    expect(controller.markerIds, ['latest']);
    expect(controller.symbolLayerProperties?.iconAllowOverlap, isTrue);
    expect(controller.symbolLayerProperties?.iconIgnorePlacement, isTrue);
    expect(controller.symbolLayerProperties?.textAllowOverlap, isTrue);
    expect(controller.symbolLayerProperties?.textIgnorePlacement, isTrue);
    expect(tester.takeException(), isNull);
  });

  testWidgets('marker refreshes are serialized and coalesce pending changes', (
    tester,
  ) async {
    final controller = _MapController();
    final map = await show(tester, {marker('initial')});
    map.onMapCreated!(controller);
    map.onStyleLoadedCallback!();
    await tester.pumpAndSettle();
    expect(controller.addGeoJsonCalls, 1);
    expect(controller.setGeoJsonCalls, 0);

    final gate = Completer<void>();
    controller.setGeoJsonGate = gate;
    await show(tester, {marker('intermediate')});
    expect(controller.updating, isTrue);
    await show(tester, {marker('skipped')});
    await show(tester, {marker('latest')});
    expect(controller.setGeoJsonCalls, 1);
    gate.complete();
    await tester.pumpAndSettle();
    expect(controller.setGeoJsonCalls, 2);
    expect(controller.markerIds, ['latest']);
    expect(controller.addSymbolLayerCalls, 1);
    expect(tester.takeException(), isNull);

    controller.failSetGeoJson = true;
    await show(tester, {marker('failed')});
    await show(tester, {marker('recovered')});
    expect(controller.markerIds, ['recovered']);
    expect(tester.takeException(), isNull);
  });

  testWidgets('disposing during a refresh stops subsequent map operations', (
    tester,
  ) async {
    final controller = _MapController();
    final map = await show(tester, {marker('initial')});
    map.onMapCreated!(controller);
    map.onStyleLoadedCallback!();
    await tester.pumpAndSettle();

    final gate = Completer<void>();
    controller.setGeoJsonGate = gate;
    await show(tester, {marker('pending')});
    await show(tester, {marker('queued')});
    expect(controller.updating, isTrue);
    expect(controller.setGeoJsonCalls, 1);

    await tester.pumpWidget(const SizedBox());
    gate.complete();
    await tester.pumpAndSettle();
    expect(controller.setGeoJsonCalls, 1);
    expect(controller.markerIds, ['pending']);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a style reload invalidates pending image and marker work', (
    tester,
  ) async {
    final controller = _MapController();
    final gate = Completer<void>();
    controller.imageGate = gate;
    final map = await show(tester, {marker('initial')});
    map.onMapCreated!(controller);
    map.onStyleLoadedCallback!();
    await tester.pumpAndSettle();
    expect(controller.imageCalls, 1);
    expect(controller.addGeoJsonCalls, 0);

    map.onStyleLoadedCallback!();
    await show(tester, {marker('latest')});
    gate.complete();
    await tester.pumpAndSettle();
    expect(controller.imageCalls, 3);
    expect(controller.addGeoJsonCalls, 1);
    expect(controller.addSymbolLayerCalls, 1);
    expect(controller.setGeoJsonCalls, 0);
    expect(controller.markerIds, ['latest']);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'marker callbacks stay out of GeoJSON and run on the second tap',
    (tester) async {
      var taps = 0;
      final marker = Marker(
        id: 'cafeteria',
        position: const maps.LatLng(48.26, 11.67),
        infoWindow: InfoWindow(title: 'Cafeteria', onTap: () => taps++),
      );
      final controller = _MapController();

      Future<maps.MapLibreMap> showMap(Set<Marker> markers) =>
          show(tester, markers);

      final map = await showMap({marker});
      map.onMapCreated!(controller);
      map.onStyleLoadedCallback!();
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      final initialProps =
          controller.features.single['properties'] as Map<String, dynamic>;
      expect(initialProps['id'], 'cafeteria');
      expect(initialProps['textOpacity'], 0.0);

      map.onMapClick!(const Point<double>(100, 100), marker.position);
      await tester.pumpAndSettle();
      expect(taps, 0);
      expect(controller.animateCameraCalls, 1);
      final selectedProps =
          controller.features.single['properties'] as Map<String, dynamic>;
      expect(selectedProps['title'], 'Cafeteria');
      expect(selectedProps['textOpacity'], 1.0);

      map.onMapClick!(const Point<double>(100, 100), marker.position);
      await tester.pumpAndSettle();
      expect(taps, 1);

      // Tapping empty space deselects the marker.
      controller.queriedFeaturesOverride = const [];
      map.onMapClick!(const Point<double>(10, 10), marker.position);
      await tester.pumpAndSettle();
      final deselectedProps =
          controller.features.single['properties'] as Map<String, dynamic>;
      expect(deselectedProps['title'], '');
      expect(deselectedProps['textOpacity'], 0.0);
      controller.queriedFeaturesOverride = null;

      // An existing marker resolves the current callback, not a stale closure.
      var replacementTaps = 0;
      await showMap({
        Marker(
          id: marker.id,
          position: marker.position,
          infoWindow: InfoWindow(
            title: 'Updated cafeteria',
            onTap: () => replacementTaps++,
          ),
        ),
      });
      map.onMapClick!(const Point<double>(100, 100), marker.position);
      await tester.pumpAndSettle();
      expect(taps, 1);
      expect(replacementTaps, 0);
      map.onMapClick!(const Point<double>(100, 100), marker.position);
      await tester.pumpAndSettle();
      expect(taps, 1);
      expect(replacementTaps, 1);

      final staleFeature = controller.features.single;
      await showMap({});
      controller.queriedFeaturesOverride = [staleFeature];
      map.onMapClick!(const Point<double>(100, 100), marker.position);
      await tester.pumpAndSettle();
      expect(replacementTaps, 1);
      expect(tester.takeException(), isNull);
    },
  );
}
