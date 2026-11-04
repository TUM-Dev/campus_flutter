import 'dart:convert';
import 'dart:io';

import 'package:campus_flutter/base/theme/light_theme.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/homeWidget/calendar_widget_event_view.dart';
import 'package:campus_flutter/calendarComponent/views/homeWidget/calendar_widget_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _TestCalendarViewModel extends CalendarViewModel {
  @override
  Future fetch(bool forcedRefresh) async {}
}

// Keep asset I/O outside the widget test's fake async clock.
class _TestTranslations extends AssetLoader {
  final Map<String, Map<String, dynamic>> translations;

  const _TestTranslations(this.translations);

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async =>
      translations[locale.languageCode]!;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late _TestTranslations translations;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
    translations = _TestTranslations({
      for (final language in ['en', 'de'])
        language: jsonDecode(
          File('assets/translations/$language.json').readAsStringSync(),
        ) as Map<String, dynamic>,
    });
  });

  for (final locale in [const Locale('en'), const Locale('de')]) {
    for (final width in [320.0, 402.0]) {
      for (final scale in [1.0, 2.0, 3.0]) {
        for (final scenario in ['empty', 'today', 'future', 'full']) {
          testWidgets(
            '${locale.languageCode}, width=$width, scale=$scale, $scenario',
            (tester) async {
              tester.view.physicalSize = Size(width, 874);
              tester.view.devicePixelRatio = 1;
              addTearDown(tester.view.reset);
              final now = DateTime.now();
              CalendarEvent event(int day) => CalendarEvent(
                id: '$day',
                status: '',
                title: 'A very long lecture title about software engineering',
                startDate: DateTime(now.year, now.month, now.day + day, 23, 59),
                endDate: DateTime(now.year, now.month, now.day + day + 1),
                locations: ['A very long location name on the Garching campus'],
              );
              final model = _TestCalendarViewModel();
              model.events.add([
                if (scenario == 'today' || scenario == 'full') event(0),
                if (scenario == 'future' || scenario == 'full') event(1),
                if (scenario == 'full') event(5),
              ]);
              addTearDown(() async {
                await model.events.close();
                await model.lastFetched.close();
                await model.isLoading.close();
                await model.widgetEvents.close();
              });

              await tester.pumpWidget(
                ProviderScope(
                  overrides: [calendarViewModel.overrideWithValue(model)],
                  child: EasyLocalization(
                    supportedLocales: const [Locale('en'), Locale('de')],
                    startLocale: locale,
                    saveLocale: false,
                    path: 'assets/translations',
                    assetLoader: translations,
                    child: Builder(
                      builder: (context) => MaterialApp(
                        locale: context.locale,
                        supportedLocales: context.supportedLocales,
                        localizationsDelegates: context.localizationDelegates,
                        theme: lightTheme(context),
                        home: MediaQuery(
                          data: MediaQueryData(
                            textScaler: TextScaler.linear(scale),
                          ),
                          child: const Scaffold(
                            body: SingleChildScrollView(
                              child: CalendarHomeWidgetView(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
              await tester.pumpAndSettle(const Duration(milliseconds: 300));

              expect(tester.takeException(), isNull);
              final eventViews = find.byType(CalendarHomeWidgetEventView);
              expect(
                eventViews,
                findsNWidgets(
                  scenario == 'empty'
                      ? 0
                      : scenario == 'full'
                      ? 3
                      : 1,
                ),
              );
              // Verify content is laid out without overlaps, even off screen.
              if (scenario == 'full') {
                final first = tester.getRect(eventViews.at(0));
                final second = tester.getRect(eventViews.at(1));
                final third = tester.getRect(eventViews.at(2));
                if (scale > 1 || width == 320) {
                  expect(second.top, greaterThanOrEqualTo(first.bottom));
                  expect(third.top, greaterThanOrEqualTo(second.bottom));
                  expect(second.left, first.left);
                  final title = find.descendant(
                    of: eventViews.at(0),
                    matching: find.text(model.events.value!.first.title!),
                  );
                  expect(tester.widget<Text>(title).maxLines, isNull);
                } else {
                  expect(second.left, greaterThanOrEqualTo(first.right));
                  expect(third.top, greaterThanOrEqualTo(second.bottom));
                }
              } else if (scenario == 'empty') {
                final date = find.text(
                  DateFormat.MMMd(locale.languageCode).format(now),
                );
                final message = find.text(
                  translations.translations[locale
                          .languageCode]!['noUpcomingEvents']
                      as String,
                );
                expect(
                  tester.getRect(message).top,
                  greaterThanOrEqualTo(tester.getRect(date).bottom),
                );
              }
            },
          );
        }
      }
    }
  }
}
