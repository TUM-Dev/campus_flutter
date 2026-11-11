import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:dio/dio.dart';
import 'package:campus_flutter/base/errorHandling/error_snackbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Messages extends AssetLoader {
  const _Messages();
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async => {
    'tryAgain': 'Try again',
    'apiUnavailable': 'Service temporarily unavailable',
    'apiTryLater': 'Please try again later.',
    'apiNotFound': 'Information unavailable',
    'apiNotFoundRecovery': 'This information is unavailable.',
    'apiRequestTimeout': 'Request timed out',
    'apiSubmissionUncertainRecovery':
        'Check whether the request completed before submitting again.',
    'noPermission': 'No permission',
    'apiForbiddenRecovery': 'Your account cannot access this information.',
    'login': 'Log in',
    'loginNeeded': 'Login required',
    'loginNeededRecovery': 'Please log in.',
  };
}

Future<void> pumpAction(
  WidgetTester tester,
  VoidCallback Function(BuildContext) action,
) async {
  await tester.pumpWidget(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [Locale('en')],
        startLocale: const Locale('en'),
        saveLocale: false,
        path: 'unused',
        assetLoader: const _Messages(),
        child: Builder(
          builder: (context) => MaterialApp(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            home: Scaffold(
              body: Builder(
                builder: (context) => TextButton(
                  onPressed: action(context),
                  child: const Text('Fail'),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  testWidgets('floating errors replace old messages and can be closed', (
    tester,
  ) async {
    var latest = false;
    await pumpAction(
      tester,
      (context) =>
          () => showErrorSnackBar(
            context,
            latest
                ? const GrpcError.notFound('Not found')
                : const GrpcError.unavailable('Unavailable'),
          ),
    );
    await tester.tap(find.text('Fail'));
    await tester.pumpAndSettle();
    expect(
      find.textContaining('Service temporarily unavailable'),
      findsOneWidget,
    );
    expect(
      tester.widget<SnackBar>(find.byType(SnackBar)).behavior,
      SnackBarBehavior.floating,
    );
    expect(find.byType(AlertDialog), findsNothing);
    latest = true;
    await tester.tap(find.text('Fail'));
    await tester.pumpAndSettle();
    expect(
      find.textContaining('Service temporarily unavailable'),
      findsNothing,
    );
    expect(find.textContaining('Information unavailable'), findsOneWidget);
    await tester.tap(find.byTooltip('Close'));
    await tester.pumpAndSettle();
    expect(find.byType(SnackBar), findsNothing);
  });

  testWidgets('native retry action invokes callback and dismisses message', (
    tester,
  ) async {
    var retries = 0;
    await pumpAction(
      tester,
      (context) =>
          () => showErrorSnackBar(
            context,
            const GrpcError.unavailable('Unavailable'),
            retry: () => retries++,
          ),
    );
    await tester.tap(find.text('Fail'));
    await tester.pumpAndSettle();
    expect(
      tester.widget<SnackBar>(find.byType(SnackBar)).action,
      isA<SnackBarAction>(),
    );
    await tester.tap(find.text('Try again'));
    await tester.pumpAndSettle();
    expect(retries, 1);
    expect(find.byType(SnackBar), findsNothing);
  });
  testWidgets(
    'submission errors preserve cause and stack without unsafe retry actions',
    (tester) async {
      const failure = GrpcError.deadlineExceeded('private details');
      final stack = StackTrace.fromString('original submission stack');
      await pumpAction(
        tester,
        (context) =>
            () => showErrorSnackBar(
              context,
              failure,
              stackTrace: stack,
              isMutation: true,
              retry: () => fail('Do not resubmit an uncertain write'),
            ),
      );
      await tester.tap(find.text('Fail'));
      await tester.pumpAndSettle();
      final router = tester.widget<ErrorHandlingRouter>(
        find.byType(ErrorHandlingRouter),
      );
      expect(router.error, same(failure));
      expect(router.stackTrace, same(stack));
      expect(router.isMutation, isTrue);
      expect(tester.widget<SnackBar>(find.byType(SnackBar)).action, isNull);
      expect(
        find.textContaining('Check whether the request completed'),
        findsOneWidget,
      );
      expect(find.textContaining('private details'), findsNothing);
      expect(find.byType(AlertDialog), findsNothing);
    },
  );

  testWidgets('Dio write context is inferred for native snackbar actions', (
    tester,
  ) async {
    final failure = DioException(
      requestOptions: RequestOptions(method: 'POST'),
      type: DioExceptionType.receiveTimeout,
    );
    await pumpAction(
      tester,
      (context) =>
          () => showErrorSnackBar(context, failure, retry: () {}),
    );
    await tester.tap(find.text('Fail'));
    await tester.pumpAndSettle();
    expect(tester.widget<SnackBar>(find.byType(SnackBar)).action, isNull);
    expect(
      find.textContaining('Check whether the request completed'),
      findsOneWidget,
    );
  });

  testWidgets('permission failures do not expose an ineffective retry action', (
    tester,
  ) async {
    await pumpAction(
      tester,
      (context) =>
          () => showErrorSnackBar(
            context,
            const GrpcError.permissionDenied('private'),
            retry: () {},
          ),
    );
    await tester.tap(find.text('Fail'));
    await tester.pumpAndSettle();
    expect(tester.widget<SnackBar>(find.byType(SnackBar)).action, isNull);
    expect(find.textContaining('No permission'), findsOneWidget);
  });

  testWidgets('invalid tokens retain the domain login action', (tester) async {
    final failure = TumOnlineApiException(
      tumOnlineApiExceptionType: TumOnlineApiExceptionInvalidToken(),
    );
    await pumpAction(
      tester,
      (context) =>
          () => showErrorSnackBar(context, failure),
    );
    await tester.tap(find.text('Fail'));
    await tester.pumpAndSettle();
    expect(
      tester.widget<SnackBar>(find.byType(SnackBar)).action?.label,
      'Log in',
    );
  });
}
