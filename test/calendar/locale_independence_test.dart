import 'package:intl/date_symbol_data_local.dart';
import 'package:campus_flutter/base/extensions/date_time.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  setUpAll(() => initializeDateFormatting('en'));
  for (final locale in ['ga_IE', '']) {
    test(
      'protocol dates, times and ISO weeks do not depend on locale "$locale"',
      () {
        final previous = Intl.defaultLocale;
        Intl.defaultLocale = locale;
        addTearDown(() => Intl.defaultLocale = previous);
        final start = DateTime(2026, 11, 13, 9, 5);
        expect(TumOnlineApi.dateFormat.format(start), '2026-11-13 09:05:00');
        final event = CalendarEvent(
          id: '1',
          status: 'FT',
          startDate: start,
          endDate: DateTime(2026, 11, 13, 10, 5),
          locations: [],
        );
        expect(event.timePeriod, '09:05 - 10:05');
        expect(DateTime(2021, 1, 1).weekNumber(), '53');
        expect(DateTime(2021, 1, 4).weekNumber(), '01');
        expect(DateTime(2024, 12, 30).weekNumber(), '01');
        expect(DateTime(2026, 11, 13).weekNumber(), '46');
      },
    );
  }
}
