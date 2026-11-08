import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/onboardingComponent/views/location_permissions_view.dart';
import 'package:campus_flutter/onboardingComponent/views/permission_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Translations extends AssetLoader {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async =>
      jsonDecode(
        File('assets/translations/${locale.languageCode}.json')
            .readAsStringSync(),
      ) as Map<String, dynamic>;
}

class _LocationPlatform extends GeolocatorPlatform {
  LocationPermission permission = LocationPermission.denied;
  Completer<LocationPermission>? pendingCheck;
  Completer<LocationPermission>? pendingRequest;
  bool failCheck = false;
  bool failRequest = false;
  int requests = 0;
  int settingsOpened = 0;

  @override
  Future<LocationPermission> checkPermission() async {
    if (failCheck) throw StateError('Unavailable');
    return pendingCheck?.future ?? permission;
  }

  @override
  Future<LocationPermission> requestPermission() async {
    requests++;
    if (failRequest) throw StateError('Unavailable');
    return pendingRequest?.future ?? permission;
  }

  @override
  Future<bool> openAppSettings() async {
    settingsOpened++;
    return true;
  }
}

class _Onboarding extends OnboardingViewModel {
  int finishes = 0;

  @override
  void finishOnboarding(WidgetRef ref, BuildContext context) {
    finishes++;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late _LocationPlatform platform;
  late _Onboarding model;
  late GeolocatorPlatform originalPlatform;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  setUp(() {
    originalPlatform = GeolocatorPlatform.instance;
    platform = _LocationPlatform();
    GeolocatorPlatform.instance = platform;
    model = _Onboarding();
  });

  tearDown(() async {
    GeolocatorPlatform.instance = originalPlatform;
    model.tumIdController.dispose();
    await model.credentials.close();
    await model.tumIdValid.close();
  });

  Future<void> openScreen(
    WidgetTester tester, {
    String language = 'en',
    Size size = const Size(390, 844),
    double scale = 1,
    Brightness brightness = Brightness.light,
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [onboardingViewModel.overrideWithValue(model)],
        child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('de')],
          startLocale: Locale(language),
          saveLocale: false,
          path: 'unused',
          assetLoader: _Translations(),
          child: Builder(
            builder: (context) => MaterialApp(
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              theme: ThemeData(brightness: brightness),
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(scale)),
                child: child!,
              ),
              home: const LocationPermissionView(),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
  }

  for (final permission in [
    LocationPermission.whileInUse,
    LocationPermission.always,
  ]) {
    testWidgets('skips the prompt for $permission', (tester) async {
      platform.permission = permission;
      await openScreen(tester);
      expect(model.finishes, 1);
      expect(find.byType(PermissionView), findsNothing);
      expect(platform.requests, 0);
    });
  }

  testWidgets('does not flash the prompt while checking access', (
    tester,
  ) async {
    platform.pendingCheck = Completer<LocationPermission>();
    await openScreen(tester);
    expect(find.byType(PermissionView), findsNothing);
    platform.pendingCheck!.complete(LocationPermission.whileInUse);
    await tester.pump();
    expect(model.finishes, 1);
    expect(find.byType(PermissionView), findsNothing);
  });

  testWidgets('can continue without asking for permission', (tester) async {
    await openScreen(tester);
    await tester.tap(find.text('Not now'));
    expect(model.finishes, 1);
    expect(platform.requests, 0);
  });

  testWidgets('requests once and finishes even if access is declined', (
    tester,
  ) async {
    platform.pendingRequest = Completer<LocationPermission>();
    await openScreen(tester);
    final button = tester
        .widget<ElevatedButton>(find.byType(ElevatedButton))
        .onPressed!;
    button();
    button();
    await tester.pump();
    expect(platform.requests, 1);
    expect(model.finishes, 0);
    expect(
      tester.widget<TextButton>(find.byType(TextButton)).onPressed,
      isNull,
    );
    platform.pendingRequest!.complete(LocationPermission.denied);
    await tester.pumpAndSettle();
    expect(model.finishes, 1);
  });

  testWidgets('opens settings for permanent denial and rechecks on resume', (
    tester,
  ) async {
    platform.permission = LocationPermission.deniedForever;
    await openScreen(tester);
    await tester.tap(find.text('Open Settings'));
    await tester.pumpAndSettle();
    expect(platform.settingsOpened, 1);
    expect(platform.requests, 0);
    expect(model.finishes, 0);
    platform.permission = LocationPermission.whileInUse;
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(model.finishes, 1);
  });

  testWidgets('allows retry or skipping after platform failures', (
    tester,
  ) async {
    platform.failCheck = true;
    platform.failRequest = true;
    await openScreen(tester);
    await tester.tap(find.text('Enable location'));
    await tester.pumpAndSettle();
    expect(find.byType(SnackBar), findsOneWidget);
    expect(model.finishes, 0);
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Not now'));
    expect(model.finishes, 1);
    expect(tester.takeException(), isNull);
  });

  for (final language in ['en', 'de']) {
    for (final brightness in Brightness.values) {
      testWidgets('fits $language large text in landscape with $brightness', (
        tester,
      ) async {
        await openScreen(
          tester,
          language: language,
          brightness: brightness,
          size: const Size(568, 320),
          scale: 2,
        );
        await tester.ensureVisible(find.byType(TextButton));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      });
    }
  }
}
