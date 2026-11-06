import 'dart:async';

import 'package:campus_flutter/base/routing/geo_link.dart';
import 'package:campus_flutter/base/routing/router_service.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/settingsComponent/viewModels/settings_viewmodel.dart';
import 'package:campus_flutter/studentCardComponent/viewModel/student_card_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  late RouterService service;
  late GoRouter router;

  Future<void> startApp(
    WidgetTester tester, {
    required Future<bool> login,
    String? pendingLocation,
  }) async {
    var created = false;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          onboardingViewModel.overrideWith((ref) => _Onboarding(login)),
          settingsViewModel.overrideWith((ref) => _Settings(ref)),
          studentCardViewModel.overrideWith((ref) => _StudentCard()),
        ],
        child: Consumer(
          builder: (context, ref, child) {
            if (!created) {
              created = true;
              service = RouterService(ref);
              if (pendingLocation != null) {
                service.alternativeRoute = pendingLocation;
              }
              router = GoRouter(
                initialLocation: onboarding,
                redirect: (context, state) => service.routingCallback(state),
                routes: [
                  GoRoute(
                    path: onboarding,
                    builder: (context, state) => const Text('Onboarding'),
                  ),
                  GoRoute(
                    path: home,
                    builder: (context, state) => const Text('Home'),
                  ),
                  GoRoute(
                    path: roomSearch,
                    builder: (context, state) =>
                        Text('Room: ${state.uri.queryParameters['q']}'),
                  ),
                ],
              );
              addTearDown(router.dispose);
            }
            return MaterialApp.router(routerConfig: router);
          },
        ),
      ),
    );
  }

  testWidgets(
    'retains a cold-start query through asynchronous initialization',
    (tester) async {
      final login = Completer<bool>();
      final location = geoSearchLocation(Uri.parse('geo://0,0?q=5602.EG.001'))!;
      await startApp(tester, login: login.future);
      expect(service.canNavigate, isFalse);
      service.alternativeRoute = location;
      login.complete(true);
      await tester.pumpAndSettle();

      expect(service.canNavigate, isTrue);
      expect(find.text('Room: 5602.EG.001'), findsOneWidget);
      router.go(home);
      await tester.pumpAndSettle();
      expect(find.text('Home'), findsOneWidget);
    },
  );

  testWidgets('preserves queries for successive links in a running app', (
    tester,
  ) async {
    await startApp(tester, login: Future.value(true));
    await tester.pumpAndSettle();
    for (final room in ['5602.EG.001', '0101.01.101']) {
      router.go(geoSearchLocation(Uri.parse('geo:0,0?q=$room'))!);
      await tester.pumpAndSettle();
      expect(find.text('Room: $room'), findsOneWidget);
    }
  });

  testWidgets('retains the query until first-time onboarding finishes', (
    tester,
  ) async {
    await startApp(
      tester,
      login: Future.value(false),
      pendingLocation: geoSearchLocation(Uri.parse('geo:0,0?q=5602.EG.001')),
    );
    await tester.pumpAndSettle();
    expect(find.text('Onboarding'), findsOneWidget);
    expect(service.isInitialized, isTrue);
    expect(service.canNavigate, isFalse);

    service.setOnboarded();
    router.go(home);
    await tester.pumpAndSettle();
    expect(find.text('Room: 5602.EG.001'), findsOneWidget);
  });
}

class _Onboarding extends OnboardingViewModel {
  _Onboarding(this.login);
  final Future<bool> login;

  @override
  Future<bool> checkLogin() => login;
}

class _Settings extends SettingsViewModel {
  _Settings(super.ref);

  @override
  Future<void> loadPreferences() async {}
}

class _StudentCard extends StudentCardViewModel {
  @override
  Future<void> fetch(bool forcedRefresh) async {}
}
