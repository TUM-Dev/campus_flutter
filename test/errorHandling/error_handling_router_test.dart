import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';

final _translations = <String, Map<String, dynamic>>{};

class _Translations extends AssetLoader {
  const _Translations();
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async =>
      _translations[locale.languageCode]!;
}

Future<void> pumpError(
  WidgetTester tester,
  Widget child, {
  String language = "en",
}) async {
  await tester.pumpWidget(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('de')],
      startLocale: Locale(language),
      saveLocale: false,
      path: 'unused',
      assetLoader: const _Translations(),
      child: Builder(
        builder: (context) => MaterialApp(
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          home: Scaffold(body: child),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
    for (final language in ['en', 'de']) {
      _translations[language] = jsonDecode(
        await rootBundle.loadString('assets/translations/$language.json'),
      ) as Map<String, dynamic>;
    }
  });
  testWidgets('gRPC hides server details and retries transient errors', (
    tester,
  ) async {
    var calls = 0;
    await pumpError(
      tester,
      ErrorHandlingRouter(
        error: const GrpcError.unavailable('private backend detail'),
        errorHandlingViewType: ErrorHandlingViewType.textOnly,
        retry: () => calls++,
      ),
    );
    expect(find.text('private backend detail'), findsNothing);
    expect(find.text('Service temporarily unavailable'), findsOneWidget);
    await tester.tap(find.byType(TextButton));
    expect(calls, 1);
    expect(tester.takeException(), isNull);
  });

  testWidgets('permission errors offer advice without a pointless retry', (
    tester,
  ) async {
    await pumpError(
      tester,
      ErrorHandlingRouter(
        error: const GrpcError.permissionDenied('private'),
        errorHandlingViewType: ErrorHandlingViewType.fullScreenNoImage,
        retry: () {},
      ),
    );
    expect(find.text('No Permission'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNothing);
  });

  testWidgets('HTTP timeout shows the correct title and recovery', (
    tester,
  ) async {
    await pumpError(
      tester,
      ErrorHandlingRouter(
        error: DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.receiveTimeout,
        ),
        errorHandlingViewType: ErrorHandlingViewType.textOnly,
        retry: () {},
      ),
    );
    expect(find.text('Connection Timeout'), findsOneWidget);
    expect(
      find.text('The service may be busy. Please try again later.'),
      findsOneWidget,
    );
    expect(find.byType(TextButton), findsOneWidget);
  });
  testWidgets(
    'German messages remain readable with large text on a small screen',
    (tester) async {
      tester.view.physicalSize = const Size(320, 480);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 2.5;
      addTearDown(tester.view.reset);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      await pumpError(
        tester,
        ErrorHandlingRouter(
          error: const GrpcError.unavailable('private'),
          errorHandlingViewType: ErrorHandlingViewType.fullScreen,
          retry: () {},
        ),
        language: 'de',
      );
      expect(find.text('Dienst vorübergehend nicht verfügbar'), findsOneWidget);
      await tester.ensureVisible(find.byType(ElevatedButton));
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets('compact errors scroll within short cards', (tester) async {
    await pumpError(
      tester,
      SizedBox(
        width: 220,
        height: 80,
        child: ErrorHandlingRouter(
          error: const GrpcError.unavailable('private'),
          errorHandlingViewType: ErrorHandlingViewType.textOnly,
          retry: () {},
        ),
      ),
    );
    await tester.ensureVisible(find.byType(TextButton));
    expect(tester.takeException(), isNull);
  });
}
