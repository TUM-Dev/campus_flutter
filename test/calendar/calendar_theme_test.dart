import 'package:campus_flutter/base/theme/dark_theme.dart';
import 'package:campus_flutter/base/theme/light_theme.dart';
import 'package:campus_flutter/calendarComponent/viewModels/calendar_viewmodel.dart';
import 'package:campus_flutter/calendarComponent/views/calendar_day_view.dart';
import 'package:campus_flutter/calendarComponent/views/calendar_month_view.dart';
import 'package:campus_flutter/calendarComponent/views/calendar_week_view.dart';
import 'package:campus_flutter/settingsComponent/views/settings_view.dart';
import 'package:material_ui/material_ui.dart';
import 'package:campus_flutter/base/theme/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

void main() {
  for (final dark in [false, true]) {
    for (final view in [
      CalendarView.day,
      CalendarView.week,
      CalendarView.month,
    ]) {
      testWidgets('$view inherits app colors and brightness (dark: $dark)', (
        tester,
      ) async {
        final controller = CalendarController();
        addTearDown(controller.dispose);
        final calendar = CalendarViewModel()..events.add([]);
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              calendarViewModel.overrideWithValue(calendar),
              showHiddenCalendarEntries.overrideWith((ref) => false),
              showWeekends.overrideWith((ref) => true),
            ],
            child: Builder(
              builder: (context) => MaterialApp(
                theme: dark ? darkTheme(context) : lightTheme(context),
                home: Scaffold(
                  body: Column(
                    children: [
                      switch (view) {
                        CalendarView.day => CalendarDayView(
                          calendarController: controller,
                        ),
                        CalendarView.week => CalendarWeekView(
                          calendarController: controller,
                        ),
                        _ => CalendarMonthView(calendarController: controller),
                      },
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        final context = tester.element(find.byType(SfCalendar));
        final appTheme = Theme.of(context);
        // Syncfusion must inherit the active app palette without an adapter.
        expect(
          SfTheme.colorScheme(context).primary.toARGB32(),
          (dark ? primaryDarkColor : primaryLightColor).toARGB32(),
        );
        expect(appTheme.brightness, dark ? Brightness.dark : Brightness.light);
        expect(MaterialLocalizations.of(context), isNotNull);
        expect(tester.takeException(), isNull);
      });
    }
  }
}
