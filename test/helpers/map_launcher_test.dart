import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:campus_flutter/base/util/map_launcher.dart';
import 'package:easy_localization/src/localization.dart';
import 'package:easy_localization/src/translations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

void main() {
  const channel = MethodChannel('plugins.flutter.io/url_launcher');
  const mapChannel = MethodChannel('map_launcher');
  const location = LatLng(48.262444, 11.669094);
  final calls = <MethodCall>[];
  final mapCalls = <MethodCall>[];
  late Future<bool> Function() launchResult;
  late Future<Object?> Function(MethodCall) mapResult;

  setUp(() {
    calls.clear();
    mapCalls.clear();
    launchResult = () async => true;
    mapResult = (call) async => call.method == 'getInstalledMaps'
        ? {
            'installed': ['apple', 'google'],
          }
        : null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          calls.add(call);
          return launchResult();
        });
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(mapChannel, (call) async {
          mapCalls.add(call);
          return mapResult(call);
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(mapChannel, null);
  });

  Future<void> openMap(WidgetTester tester, String name) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [_TestLocalizationDelegate()],
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () => showDirectionsDialog(name, location, context),
              child: const Text('Open map'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open map'));
    await tester.pump();
  }

  testWidgets('opens room coordinates using the Android geo handler', (
    tester,
  ) async {
    await openMap(tester, '5602.EG.001');

    expect(calls, hasLength(1));
    expect(calls.single.method, 'launch');
    final args = calls.single.arguments as Map;
    final uri = Uri.parse(args['url'] as String);
    expect(uri.scheme, 'geo');
    expect(uri.path, '0,0');
    final query = uri.queryParameters['q']!;
    final coordinates = query.split('(').first.split(',').map(double.parse);
    expect(coordinates.first, closeTo(48.262444, 1e-9));
    expect(coordinates.last, closeTo(11.669094, 1e-9));
    expect(query, endsWith('(5602.EG.001)'));
    expect(args['useWebView'], isFalse);
    expect(args['useSafariVC'], isFalse);
    expect(find.byType(BottomSheet), findsNothing);
    expect(find.byType(SnackBar), findsNothing);
    expect(mapCalls, isEmpty);
  }, variant: TargetPlatformVariant.only(TargetPlatform.android));

  testWidgets('preserves spaces, Unicode and query characters in room names', (
    tester,
  ) async {
    const name = 'Hörsaal A & B + C #1';
    await openMap(tester, name);

    final uri = Uri.parse(calls.single.arguments['url'] as String);
    expect(uri.queryParameters.keys, ['q']);
    expect(uri.queryParameters['q'], endsWith('($name)'));
    expect(uri.toString(), contains('%20'));
    expect(uri.toString(), isNot(contains('+')));
  }, variant: TargetPlatformVariant.only(TargetPlatform.android));

  testWidgets('shows feedback when no map app can open the location', (
    tester,
  ) async {
    launchResult = () async => false;
    await openMap(tester, '5602.EG.001');

    expect(find.byType(SnackBar), findsOneWidget);
    expect(tester.takeException(), isNull);
  }, variant: TargetPlatformVariant.only(TargetPlatform.android));

  testWidgets('shows feedback when the platform reports a launch error', (
    tester,
  ) async {
    launchResult = () async =>
        throw PlatformException(code: 'ACTIVITY_NOT_FOUND');
    await openMap(tester, '5602.EG.001');

    expect(find.byType(SnackBar), findsOneWidget);
    expect(tester.takeException(), isNull);
  }, variant: TargetPlatformVariant.only(TargetPlatform.android));

  testWidgets('handles a launch failure after the room view is disposed', (
    tester,
  ) async {
    final result = Completer<bool>();
    launchResult = () => result.future;
    await openMap(tester, '5602.EG.001');
    await tester.pumpWidget(const SizedBox());
    result.complete(false);
    await tester.pump();

    expect(tester.takeException(), isNull);
  }, variant: TargetPlatformVariant.only(TargetPlatform.android));

  testWidgets(
    'uses the iOS default-navigation place handoff without a picker',
    (tester) async {
      await openMap(tester, '5602.EG.001');

      expect(calls, hasLength(1));
      final args = calls.single.arguments as Map;
      final uri = Uri.parse(args['url'] as String);
      expect(uri.scheme, 'geo-navigation');
      expect(uri.host, isEmpty);
      expect(uri.path, '/place');
      final coordinates = uri.queryParameters['coordinate']!
          .split(',')
          .map(double.parse);
      expect(coordinates.first, closeTo(48.262444, 1e-9));
      expect(coordinates.last, closeTo(11.669094, 1e-9));
      expect(args['useWebView'], isFalse);
      expect(args['useSafariVC'], isFalse);
      expect(mapCalls, isEmpty);
      expect(find.byType(BottomSheet), findsNothing);
    },
    variant: TargetPlatformVariant.only(TargetPlatform.iOS),
  );

  testWidgets('falls back to the iOS picker when the handoff is unavailable', (
    tester,
  ) async {
    launchResult = () async => false;
    await openMap(tester, '5602.EG.001');
    await tester.pumpAndSettle();

    expect(mapCalls.single.method, 'getInstalledMaps');
    expect(find.byType(BottomSheet), findsOneWidget);
    expect(find.text('Open in Apple Maps'), findsOneWidget);
    expect(find.text('Open in Google Maps'), findsOneWidget);
    expect(find.text('Open in Waze'), findsNothing);
    expect(find.byType(SnackBar), findsNothing);
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('falls back to the iOS picker on a platform error', (
    tester,
  ) async {
    launchResult = () async => throw PlatformException(code: 'UNAVAILABLE');
    await openMap(tester, '5602.EG.001');
    await tester.pumpAndSettle();

    expect(find.byType(BottomSheet), findsOneWidget);
    expect(tester.takeException(), isNull);
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('launches the selected fallback map and closes the picker', (
    tester,
  ) async {
    launchResult = () async => false;
    await openMap(tester, '5602.EG.001');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Open in Google Maps'));
    await tester.pumpAndSettle();

    expect(mapCalls.last.method, 'launch');
    final uri = Uri.parse(mapCalls.last.arguments['url'] as String);
    expect(uri.scheme, 'comgooglemaps');
    expect(uri.queryParameters['q'], contains('5602.EG.001'));
    expect(find.byType(BottomSheet), findsNothing);
    expect(tester.takeException(), isNull);
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('reports a failed fallback launch and dismisses the picker', (
    tester,
  ) async {
    launchResult = () async => false;
    mapResult = (call) async {
      if (call.method == 'launch') {
        throw PlatformException(code: 'LAUNCH_REJECTED');
      }
      return {
        'installed': ['apple', 'google'],
      };
    };
    await openMap(tester, '5602.EG.001');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Open in Google Maps'));
    await tester.pumpAndSettle();

    expect(find.byType(BottomSheet), findsNothing);
    expect(find.byType(SnackBar), findsOneWidget);
    expect(tester.takeException(), isNull);
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('does not show a fallback after the iOS room view is disposed', (
    tester,
  ) async {
    final result = Completer<bool>();
    launchResult = () => result.future;
    await openMap(tester, '5602.EG.001');
    await tester.pumpWidget(const SizedBox());
    result.complete(false);
    await tester.pump();

    expect(mapCalls, isEmpty);
    expect(tester.takeException(), isNull);
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));
}

class _TestLocalizationDelegate extends LocalizationsDelegate<Localization> {
  const _TestLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<Localization> load(Locale locale) {
    Localization.load(
      locale,
      translations: Translations(
        jsonDecode(File('assets/translations/en.json').readAsStringSync())
            as Map<String, dynamic>,
      ),
    );
    return SynchronousFuture(Localization.instance);
  }

  @override
  bool shouldReload(_TestLocalizationDelegate old) => false;
}
