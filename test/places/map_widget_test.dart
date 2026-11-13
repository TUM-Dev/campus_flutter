import 'dart:async';
import 'dart:convert';

import 'package:campus_flutter/placesComponent/model/maps/marker.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maplibre_gl/maplibre_gl.dart' as maps;

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

class _SymbolManager implements maps.SymbolManager {
  int configurations = 0;

  @override
  Future<void> setIconAllowOverlap(bool value) async => configurations++;
  @override
  Future<void> setIconIgnorePlacement(bool value) async => configurations++;
  @override
  Future<void> setTextAllowOverlap(bool value) async => configurations++;
  @override
  Future<void> setTextIgnorePlacement(bool value) async => configurations++;
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _MapController implements maps.MapLibreMapController {
  Completer<void>? clearGate;
  Completer<void>? imageGate;
  bool failClear = false;
  int clearCalls = 0;
  int imageCalls = 0;
  bool clearing = false;
  @override
  final onSymbolTapped = maps.ArgumentCallbacks<maps.Symbol>();

  @override
  final symbols = <maps.Symbol>{};

  @override
  final _SymbolManager symbolManager = _SymbolManager();

  @override
  Future<void> clearSymbols() async {
    if (clearing) throw StateError('Overlapping marker updates');
    if (failClear) {
      failClear = false;
      throw StateError('Style was replaced');
    }
    clearCalls++;
    clearing = true;
    final gate = clearGate;
    clearGate = null;
    await gate?.future;
    symbols.clear();
    clearing = false;
  }

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
  Future<maps.Symbol> addSymbol(
    maps.SymbolOptions options, [
    Map<String, dynamic>? data,
  ]) async {
    if (clearing) throw StateError('Adding markers during a clear');
    final symbol = maps.Symbol('${symbols.length}', options, data);
    // Exercise the same serialization boundary as MapLibre's GeoJSON source.
    jsonEncode(symbol.toGeoJson());
    symbols.add(symbol);
    return symbol;
  }

  @override
  Future<void> updateSymbol(
    maps.Symbol symbol,
    maps.SymbolOptions changes,
  ) async => symbol.options = symbol.options.copyWith(changes);

  @override
  Future<bool?> animateCamera(
    maps.CameraUpdate cameraUpdate, {
    Duration? duration,
  }) async => true;

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
    expect(controller.clearCalls, 0);
    expect(controller.symbols, isEmpty);

    map.onStyleLoadedCallback!();
    await tester.pumpAndSettle();
    expect(controller.symbols.single.data?['id'], 'latest');
    expect(controller.symbolManager.configurations, 4);
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

    final gate = Completer<void>();
    controller.clearGate = gate;
    await show(tester, {marker('intermediate')});
    expect(controller.clearing, isTrue);
    await show(tester, {marker('latest')});
    expect(controller.clearCalls, 2);
    gate.complete();
    await tester.pumpAndSettle();
    expect(controller.symbols.single.data?['id'], 'latest');
    expect(controller.symbolManager.configurations, 4);
    expect(tester.takeException(), isNull);

    controller.failClear = true;
    await show(tester, {marker('failed')});
    await show(tester, {marker('recovered')});
    expect(controller.symbols.single.data?['id'], 'recovered');
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
    controller.clearGate = gate;
    await show(tester, {marker('pending')});
    await tester.pumpWidget(const SizedBox());
    gate.complete();
    await tester.pumpAndSettle();
    expect(controller.symbols, isEmpty);
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
    map.onStyleLoadedCallback!();
    await show(tester, {marker('latest')});
    gate.complete();
    await tester.pumpAndSettle();
    expect(controller.imageCalls, 3);
    expect(controller.symbolManager.configurations, 4);
    expect(controller.clearCalls, 1);
    expect(controller.symbols.single.data?['id'], 'latest');
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

      Future<void> show(Set<Marker> markers) async {
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              home: Scaffold(body: MapWidget.noPadding(markers: markers)),
            ),
          ),
        );
        await tester.pumpAndSettle();
      }

      await show({marker});
      final map = tester.widget<maps.MapLibreMap>(
        find.byType(maps.MapLibreMap),
      );
      map.onMapCreated!(controller);
      map.onStyleLoadedCallback!();
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      final symbol = controller.symbols.single;
      expect(symbol.data, {'id': 'cafeteria'});
      controller.onSymbolTapped(symbol);
      await tester.pumpAndSettle();
      expect(taps, 0);
      controller.onSymbolTapped(symbol);
      await tester.pumpAndSettle();
      expect(taps, 1);

      // An existing symbol resolves the current callback, not a stale closure.
      var replacementTaps = 0;
      await show({
        Marker(
          id: marker.id,
          position: marker.position,
          infoWindow: InfoWindow(
            title: 'Updated cafeteria',
            onTap: () => replacementTaps++,
          ),
        ),
      });
      final replacement = controller.symbols.single;
      controller.onSymbolTapped(replacement);
      controller.onSymbolTapped(replacement);
      await tester.pumpAndSettle();
      expect(taps, 1);
      expect(replacementTaps, 1);

      await show({});
      controller.onSymbolTapped(replacement);
      await tester.pumpAndSettle();
      expect(replacementTaps, 1);
      expect(tester.takeException(), isNull);
    },
  );
}
