import 'dart:convert';

import 'package:campus_flutter/homeComponent/model/departure.dart';
import 'package:campus_flutter/homeComponent/model/mvv_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// Decode JSON directly — MVV returns JSON, not XML.
  Map<String, dynamic> fromJsonString(String s) =>
      jsonDecode(s) as Map<String, dynamic>;

  group('Departure JSON decoding', () {
    test('decodes a full departure with realDateTime', () {
      final json = fromJsonString('''
{
  "stopID": "91000480",
  "countdown": "3",
  "dateTime": {
    "year": "2024", "month": "4", "day": "15",
    "weekday": "1", "hour": "10", "minute": "5"
  },
  "realDateTime": {
    "year": "2024", "month": "4", "day": "15",
    "weekday": "1", "hour": "10", "minute": "8"
  },
  "servingLine": {
    "key": "1",
    "code": "1",
    "number": "U6",
    "symbol": "U6",
    "direction": "Klinikum Großhadern",
    "name": "U-Bahn"
  }
}
''');
      final departure = Departure.fromJson(json);

      expect(departure.stopId, 91000480);
      expect(departure.countdown, 3);
      expect(departure.dateTime, DateTime(2024, 4, 15, 10, 5));
      expect(departure.realDateTime, DateTime(2024, 4, 15, 10, 8));
      expect(departure.servingLine.number, 'U6');
      expect(departure.servingLine.direction, 'Klinikum Großhadern');
    });

    test('decodes when dateTime / realDateTime are absent (null)', () {
      final json = fromJsonString('''
{
  "stopID": "91000480",
  "countdown": "5",
  "servingLine": {
    "key": "2",
    "code": "3",
    "number": "X98",
    "symbol": "X98",
    "direction": "Garching Forschungszentrum",
    "name": "Bus"
  }
}
''');
      final departure = Departure.fromJson(json);

      expect(departure.dateTime, isNull);
      expect(departure.realDateTime, isNull);
    });

    test('decodes optional delay on ServingLine', () {
      final json = fromJsonString('''
{
  "stopID": "91000480",
  "countdown": "2",
  "servingLine": {
    "key": "1",
    "code": "4",
    "number": "S2",
    "symbol": "S2",
    "direction": "Petershausen",
    "name": "S-Bahn",
    "delay": "4"
  }
}
''');
      final departure = Departure.fromJson(json);

      expect(departure.servingLine.delay, 4);
    });

    test('ServingLine.delay is null when absent', () {
      final json = fromJsonString('''
{
  "stopID": "91000002",
  "countdown": "1",
  "servingLine": {
    "key": "3",
    "code": "1",
    "number": "U3",
    "symbol": "U3",
    "direction": "Fürstenried West",
    "name": "U-Bahn"
  }
}
''');
      final departure = Departure.fromJson(json);

      expect(departure.servingLine.delay, isNull);
    });
  });

  group('MvvResponse JSON decoding', () {
    test('decodes a response with a list of departures', () {
      final json = fromJsonString('''
{
  "departureList": [
    {
      "stopID": "91000480",
      "countdown": "3",
      "servingLine": {
        "key": "1", "code": "1", "number": "U6",
        "symbol": "U6", "direction": "Klinikum Großhadern", "name": "U-Bahn"
      }
    },
    {
      "stopID": "91000480",
      "countdown": "9",
      "servingLine": {
        "key": "1", "code": "1", "number": "U6",
        "symbol": "U6", "direction": "Klinikum Großhadern", "name": "U-Bahn"
      }
    }
  ]
}
''');
      final response = MvvResponse.fromJson(json);

      expect(response.departures.length, 2);
      expect(response.departures[0].countdown, 3);
      expect(response.departures[1].countdown, 9);
    });

    test('single departure returned as nested Map (readDepartures Map branch)', () {
      // When MVV returns exactly 1 departure it uses
      // {"departureList": {"departure": {...}}} instead of a list.
      // readDepartures handles this by wrapping [{...}].
      final json = fromJsonString('''
{
  "departureList": {
    "departure": {
      "stopID": "91000480",
      "countdown": "7",
      "servingLine": {
        "key": "1", "code": "1", "number": "U6",
        "symbol": "U6", "direction": "Klinikum Großhadern", "name": "U-Bahn"
      }
    }
  }
}
''');
      final response = MvvResponse.fromJson(json);

      expect(response.departures.length, 1);
      expect(response.departures.first.countdown, 7);
      expect(response.departures.first.servingLine.number, 'U6');
    });

    test('returns empty departures list when departureList is absent', () {
      final json = fromJsonString('{}');
      final response = MvvResponse.fromJson(json);

      expect(response.departures, isEmpty);
    });
  });

  group('ServingLine colors', () {
    ServingLine makeServingLine(int code, String number) =>
        ServingLine.fromJson({
          'key': '1',
          'code': code.toString(),
          'number': number,
          'symbol': number,
          'direction': 'Test',
          'name': 'Test',
        });

    test('U6 (code 1) → blue', () {
      final line = makeServingLine(1, 'U6');
      expect(line.color.value, const Color.fromRGBO(0, 114, 179, 1.0).value);
    });

    test('code 4 (S-Bahn) → red', () {
      final line = makeServingLine(4, 'S1');
      expect(line.color.value, const Color.fromRGBO(226, 7, 18, 1.0).value);
    });

    test('unknown code → grey', () {
      final line = makeServingLine(99, 'Bus');
      expect(line.color, Colors.grey);
    });
  });
}
