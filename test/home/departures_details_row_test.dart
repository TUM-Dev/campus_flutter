import 'package:campus_flutter/homeComponent/model/departure.dart';
import 'package:campus_flutter/homeComponent/view/departure/departures_details_row_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  testWidgets('time and delay formatting work with an empty default locale', (
    tester,
  ) async {
    final previous = Intl.defaultLocale;
    addTearDown(() => Intl.defaultLocale = previous);
    Intl.defaultLocale = '';
    final departure = Departure(
      stopId: 1,
      countdown: 5,
      dateTime: DateTime(2026, 11, 13, 8, 2),
      realDateTime: DateTime(2026, 11, 13, 8, 5),
      servingLine: ServingLine(
        key: 1,
        code: 1,
        number: 'U6',
        symbol: 'U',
        direction: 'Garching',
        name: 'U6',
        delay: 3,
      ),
    );
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: DeparturesDetailsRowView(departure: departure)),
        ),
      ),
    );
    expect(find.text('08:05'), findsOneWidget);
    expect(find.text('+03'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
