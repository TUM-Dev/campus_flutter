import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/status_message.dart';
import 'package:campus_flutter/base/util/status_message_banner.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/onboardingComponent/views/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Translations extends AssetLoader {
  final Map<String, Map<String, dynamic>> values = {
    for (final language in ['en', 'de'])
      language: jsonDecode(
        File('assets/translations/$language.json').readAsStringSync(),
      ) as Map<String, dynamic>,
  };

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async =>
      values[locale.languageCode]!;
}

class _PendingLogin extends OnboardingViewModel {
  final response = Completer<void>();
  int requests = 0;

  @override
  Future<void> requestLogin() {
    requests++;
    return response.future;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late _Translations translations;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
    translations = _Translations();
  });

  Future<GoRouter> openLogin(
    WidgetTester tester,
    OnboardingViewModel model, {
    String language = 'en',
    Size size = const Size(320, 700),
    double scale = 1,
    double keyboardHeight = 0,
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    addTearDown(() async {
      model.tumIdController.dispose();
      await model.tumIdValid.close();
      await model.credentials.close();
    });
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, _) => const LoginView()),
        GoRoute(
          path: confirm,
          builder: (_, _) => const Text('Activation screen'),
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [onboardingViewModel.overrideWithValue(model)],
        child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('de')],
          startLocale: Locale(language),
          saveLocale: false,
          assetLoader: translations,
          path: 'unused',
          child: Builder(
            builder: (context) => MaterialApp.router(
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: [
                ...GlobalMaterialLocalizations.delegates,
                ...context.localizationDelegates,
              ],
              routerConfig: router,
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.linear(scale),
                  viewInsets: EdgeInsets.only(bottom: keyboardHeight),
                ),
                child: child!,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return router;
  }

  for (final language in ['en', 'de']) {
    testWidgets('updates the $language status message before login', (
      tester,
    ) async {
      await openLogin(
        tester,
        OnboardingViewModel(),
        language: language,
        size: const Size(320, 568),
        scale: 2,
        keyboardHeight: 200,
      );
      final container = ProviderScope.containerOf(
        tester.element(find.byType(LoginView)),
      );
      expect(find.byType(StatusMessageBanner), findsNothing);

      const message = LocalizedStatusMessage(
        english: 'TUMonline is under maintenance until 18:00. Please try again later.',
        german: 'TUMonline wird bis 18:00 Uhr gewartet. Bitte versuche es später erneut.',
      );
      container.read(hasStatusMessage.notifier).state = (true, message);
      await tester.pumpAndSettle();

      final text = find.text(message.textForLanguage(language));
      expect(text, findsOneWidget);
      final bannerRect = tester.getRect(find.byType(StatusMessageBanner));
      expect(bannerRect.left, 0);
      expect(bannerRect.width, 320);
      expect(
        tester.renderObject<RenderParagraph>(text).didExceedMaxLines,
        isFalse,
      );
      await tester.ensureVisible(find.byType(TextField));
      await tester.pumpAndSettle();
      expect(tester.getRect(find.byType(StatusMessageBanner)), bannerRect);
      expect(tester.takeException(), isNull);

      const updatedMessage = LocalizedStatusMessage(
        english: 'Service restored.',
        german: 'Dienst wieder verfügbar.',
      );
      container.read(hasStatusMessage.notifier).state = (true, updatedMessage);
      await tester.pumpAndSettle();
      expect(text, findsNothing);
      expect(
        find.text(updatedMessage.textForLanguage(language)),
        findsOneWidget,
      );

      container.read(hasStatusMessage.notifier).state = (false, null);
      await tester.pumpAndSettle();
      expect(find.byType(StatusMessageBanner), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('guides $language users to the right identifier', (
      tester,
    ) async {
      final model = OnboardingViewModel();
      await openLogin(tester, model, language: language);
      final strings = translations.values[language]!;
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text(strings['findTumId'] as String), findsOneWidget);
      expect(
        tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        isNull,
      );

      await tester.enterText(find.byType(TextField), 'name@tum.de');
      await tester.pump();
      expect(find.text(strings['tumIdEmailError'] as String), findsOneWidget);
      expect(
        tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        isNull,
      );

      await tester.enterText(find.byType(TextField), '03712345');
      await tester.pump();
      expect(find.text(strings['tumIdNumberError'] as String), findsOneWidget);

      await tester.enterText(find.byType(TextField), ' GO42TUM ');
      await tester.pump();
      expect(model.tumId, 'go42tum');
      expect(find.text(strings['tumIdNumberError'] as String), findsNothing);
      expect(
        tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        isNotNull,
      );
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('does not scroll when the form fits below the banner', (
    tester,
  ) async {
    await openLogin(tester, OnboardingViewModel(), size: const Size(430, 1000));
    final container = ProviderScope.containerOf(
      tester.element(find.byType(LoginView)),
    );
    container.read(hasStatusMessage.notifier).state = (
      true,
      const LocalizedStatusMessage(
        english: 'Scheduled maintenance.',
        german: 'Geplante Wartung.',
      ),
    );
    await tester.pumpAndSettle();

    final scrollable = tester.state<ScrollableState>(
      find.byType(Scrollable).first,
    );
    expect(scrollable.position.maxScrollExtent, 0);
    expect(tester.takeException(), isNull);
  });

  testWidgets('prevents duplicate requests and advances only after success', (
    tester,
  ) async {
    final model = _PendingLogin();
    await openLogin(tester, model);
    await tester.enterText(find.byType(TextField), 'go42tum');
    await tester.pump();
    final submit = tester
        .widget<ElevatedButton>(find.byType(ElevatedButton))
        .onPressed!;
    submit();
    submit();
    await tester.pump();
    expect(model.requests, 1);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(tester.widget<TextField>(find.byType(TextField)).enabled, isFalse);

    model.response.complete();
    await tester.pumpAndSettle();
    expect(find.text('Activation screen'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('keeps the ID and allows retry after a failed request', (
    tester,
  ) async {
    final model = _PendingLogin();
    await openLogin(tester, model);
    await tester.enterText(find.byType(TextField), 'go42tum');
    await tester.pump();
    tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed!();
    await tester.pump();
    model.response.completeError(Exception('Request failed'));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Activation screen'), findsNothing);
    expect(model.tumIdController.text, 'go42tum');
    expect(tester.widget<TextField>(find.byType(TextField)).enabled, isTrue);
    expect(
      tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
      isNotNull,
    );
    expect(tester.takeException(), isNull);
  });

  for (final size in [const Size(320, 568), const Size(700, 320)]) {
    testWidgets('scrolls with large text and keyboard at $size', (
      tester,
    ) async {
      await openLogin(
        tester,
        OnboardingViewModel(),
        language: 'de',
        size: size,
        scale: 2,
        keyboardHeight: 200,
      );
      await tester.ensureVisible(find.byType(TextField));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
  }
}
