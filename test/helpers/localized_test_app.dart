import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';

class _Translations extends AssetLoader {
  const _Translations();
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async => {
    'apiNotFound': 'Information unavailable',
    'apiNotFoundRecovery': 'This information is unavailable.',
    'apiUnavailable': 'Service temporarily unavailable',
    'apiTryLater': 'Please try again later.',
    'more': 'More',
    'news': 'News',
    'tryAgain': 'Try again',
  };
}

Future<void> pumpCard(WidgetTester tester, Widget child) async {
  await tester.pumpWidget(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      startLocale: const Locale('en'),
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
          home: Scaffold(body: SingleChildScrollView(child: child)),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}
