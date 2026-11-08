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
    expect(find.text('Unavailable'), findsOneWidget);
    expect(
      tester.widget<SnackBar>(find.byType(SnackBar)).behavior,
      SnackBarBehavior.floating,
    );
    expect(find.byType(AlertDialog), findsNothing);
    latest = true;
    await tester.tap(find.text('Fail'));
    await tester.pumpAndSettle();
    expect(find.text('Unavailable'), findsNothing);
    expect(find.text('Not found'), findsOneWidget);
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
}
