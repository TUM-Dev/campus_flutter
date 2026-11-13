import 'dart:convert';

import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:dio/dio.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart' hide Response;

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
          localizationsDelegates: [
            ...GlobalMaterialLocalizations.delegates,
            ...context.localizationDelegates,
          ],
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
  const serviceNotice =
      'Kalenderabruf temporär nicht möglich! Bitte TUMonline nutzen! Techniker ist informiert!';
  for (final language in ['en', 'de']) {
    for (final view in ErrorHandlingViewType.values) {
      testWidgets('TUMonline notice is preserved in $language / ${view.name}', (
        tester,
      ) async {
        await pumpError(
          tester,
          ProviderScope(
            child: ErrorHandlingRouter(
              error: TumOnlineApiException.fromJson({
                'error': {'message': serviceNotice},
              }),
              errorHandlingViewType: view,
            ),
          ),
          language: language,
        );
        expect(find.textContaining(serviceNotice), findsOneWidget);
        expect(
          find.textContaining(
            language == 'en'
                ? 'Message from TUMonline:'
                : 'Nachricht von TUMonline:',
          ),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            language == 'en' ? 'Please try again' : 'Bitte versuche',
          ),
          findsNothing,
        );
        expect(tester.takeException(), isNull);
      });
    }
  }
  testWidgets(
    'technical TUMonline payload retains generic localized recovery',
    (tester) async {
      await pumpError(
        tester,
        ProviderScope(
          child: ErrorHandlingRouter(
            error: TumOnlineApiException.fromJson({
              'error': {'message': '<html>private server detail</html>'},
            }),
            errorHandlingViewType: ErrorHandlingViewType.textOnly,
          ),
        ),
      );
      expect(find.textContaining('private server detail'), findsNothing);
      expect(find.textContaining('Message from TUMonline:'), findsNothing);
    },
  );

  testWidgets(
    'arbitrary HTTP response messages keep status-based presentation',
    (tester) async {
      final options = RequestOptions(path: '/api');
      await pumpError(
        tester,
        ErrorHandlingRouter(
          error: DioException.badResponse(
            statusCode: 503,
            requestOptions: options,
            response: Response(
              requestOptions: options,
              statusCode: 503,
              data: {
                'error': {'message': 'private backend diagnostic'},
              },
            ),
          ),
          errorHandlingViewType: ErrorHandlingViewType.textOnly,
        ),
      );
      expect(find.text('Service temporarily unavailable'), findsOneWidget);
      expect(find.textContaining('private backend diagnostic'), findsNothing);
    },
  );

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
    expect(find.text('Request timed out'), findsOneWidget);
    expect(find.text('Please try again later.'), findsOneWidget);
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
  for (final entry in {
    500: 'The service encountered a problem',
    501: 'Feature unavailable',
    502: 'Service connection problem',
    503: 'Service temporarily unavailable',
    504: 'The service took too long to respond',
  }.entries) {
    testWidgets('HTTP ${entry.key} has accurate service-side advice', (
      tester,
    ) async {
      final options = RequestOptions();
      await pumpError(
        tester,
        ErrorHandlingRouter(
          error: DioException.badResponse(
            statusCode: entry.key,
            requestOptions: options,
            response: Response(requestOptions: options, statusCode: entry.key),
          ),
          errorHandlingViewType: ErrorHandlingViewType.textOnly,
          retry: () {},
        ),
      );
      expect(find.text(entry.value), findsOneWidget);
      expect(find.textContaining('busy'), findsNothing);
      expect(
        find.byType(TextButton),
        entry.key == 501 ? findsNothing : findsOneWidget,
      );
    });
  }

  testWidgets('gRPC internal errors do not claim the service is busy', (
    tester,
  ) async {
    await pumpError(
      tester,
      const ErrorHandlingRouter(
        error: GrpcError.internal('private server details'),
        errorHandlingViewType: ErrorHandlingViewType.textOnly,
      ),
    );
    expect(find.text('The service encountered a problem'), findsOneWidget);
    expect(find.text('Service temporarily unavailable'), findsNothing);
  });

  for (final language in ['en', 'de']) {
    testWidgets('feedback timeout explains uncertain outcome in $language', (
      tester,
    ) async {
      await pumpError(
        tester,
        ErrorHandlingRouter(
          error: const GrpcError.deadlineExceeded('private'),
          isMutation: true,
          errorHandlingViewType: ErrorHandlingViewType.textOnly,
          retry: () =>
              fail('A write must not be retried without checking its outcome'),
        ),
        language: language,
      );
      expect(
        find.text(
          _translations[language]!['apiSubmissionUncertainRecovery'] as String,
        ),
        findsOneWidget,
      );
      expect(find.byType(TextButton), findsNothing);
    });
  }

  for (final options in [
    RequestOptions(method: 'POST'),
    RequestOptions(method: 'GET', extra: {'mutation': true}),
  ]) {
    testWidgets(
      'Dio recognizes ${options.method} mutations without a caller flag',
      (tester) async {
        await pumpError(
          tester,
          ErrorHandlingRouter(
            error: DioException(
              requestOptions: options,
              type: DioExceptionType.receiveTimeout,
            ),
            errorHandlingViewType: ErrorHandlingViewType.textOnly,
            retry: () {},
          ),
        );
        expect(
          find.text(
            _translations['en']!['apiSubmissionUncertainRecovery'] as String,
          ),
          findsOneWidget,
        );
        expect(find.byType(TextButton), findsNothing);
      },
    );
  }

  testWidgets('uncached reads still allow a safe retry', (tester) async {
    await pumpError(
      tester,
      ErrorHandlingRouter(
        error: DioException(
          requestOptions: RequestOptions(
            method: 'GET',
            extra: {'noCache': true},
          ),
          type: DioExceptionType.receiveTimeout,
        ),
        errorHandlingViewType: ErrorHandlingViewType.textOnly,
        retry: () {},
      ),
    );
    expect(find.text('Please try again later.'), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);
  });
}
