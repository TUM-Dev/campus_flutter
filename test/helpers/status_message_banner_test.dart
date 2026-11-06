import 'package:campus_flutter/base/util/status_message.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _EmptyTranslations extends AssetLoader {
  const _EmptyTranslations();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async => {};
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  const english =
      'TUMonline is under maintenance until 18:00. Please try again later.';
  const german =
      'TUMonline wird bis 18:00 Uhr gewartet. Bitte versuche es später erneut.';

  for (final language in ['en', 'de']) {
    for (final scale in [1.0, 3.0]) {
      testWidgets('wraps $language custom text at scale $scale', (
        tester,
      ) async {
        tester.view.physicalSize = const Size(320, 1200);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              hasStatusMessage.overrideWith(
                (ref) => (
                  true,
                  const LocalizedStatusMessage(
                    english: english,
                    german: german,
                  ),
                ),
              ),
            ],
            child: EasyLocalization(
              supportedLocales: const [Locale('en'), Locale('de')],
              startLocale: Locale(language),
              saveLocale: false,
              path: 'unused',
              assetLoader: const _EmptyTranslations(),
              child: Consumer(
                builder: (context, ref, child) => MaterialApp(
                  locale: context.locale,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  home: Builder(
                    builder: (context) => MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: TextScaler.linear(scale)),
                      child: Consumer(
                        builder: (context, ref, child) => Scaffold(
                          appBar: AppBar(
                            bottom: NavigationService().bottom(context, ref),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final text = find.text(language == 'de' ? german : english);
        expect(text, findsOneWidget);
        final paragraph = tester.renderObject<RenderParagraph>(text);
        expect(paragraph.didExceedMaxLines, isFalse);
        final banner = tester.widget<AppBar>(find.byType(AppBar)).bottom!;
        expect(banner.preferredSize.height, greaterThan(35));
        expect(tester.takeException(), isNull);
      });
    }
  }
}
