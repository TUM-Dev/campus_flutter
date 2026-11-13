import 'dart:convert';

import 'package:campus_flutter/placesComponent/model/maps/marker.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

class _MapController implements maps.MapLibreMapController {
  @override
  final onSymbolTapped = maps.ArgumentCallbacks<maps.Symbol>();

  @override
  final symbols = <maps.Symbol>{};

  @override
  get symbolManager => null;

  @override
  Future<void> clearSymbols() async => symbols.clear();

  @override
  Future<void> addImage(
    String name,
    Uint8List bytes, [
    bool sdf = false,
    double? pixelRatio,
  ]) async {}

  @override
  Future<maps.Symbol> addSymbol(
    maps.SymbolOptions options, [
    Map<String, dynamic>? data,
  ]) async {
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
      expect(taps, 0);
      controller.onSymbolTapped(symbol);
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
      expect(taps, 1);
      expect(replacementTaps, 1);

      await show({});
      controller.onSymbolTapped(replacement);
      expect(replacementTaps, 1);
      expect(tester.takeException(), isNull);
    },
  );
}
