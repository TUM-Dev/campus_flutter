import 'dart:convert';

import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/dish.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/meal_plan.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, dynamic> j(String s) => jsonDecode(s) as Map<String, dynamic>;

  group('Cafeteria JSON decoding', () {
    test('decodes a full cafeteria with opening hours', () {
      final json = j('''
{
  "location": {
    "latitude": 48.14735,
    "longitude": 11.56774,
    "address": "Arcisstraße 17, 80333 München"
  },
  "name": "Mensa Arcisstraße",
  "canteen_id": "mensa-arcisstr",
  "queue_status": "low",
  "open_hours": {
    "mon": {"start": "11:00", "end": "14:00"},
    "tue": {"start": "11:00", "end": "14:00"},
    "wed": {"start": "11:00", "end": "14:00"},
    "thu": {"start": "11:00", "end": "14:00"},
    "fri": {"start": "11:00", "end": "13:30"}
  }
}
''');
      final cafeteria = Cafeteria.fromJson(json);

      expect(cafeteria.name, 'Mensa Arcisstraße');
      expect(cafeteria.id, 'mensa-arcisstr');
      expect(cafeteria.queueStatusApi, 'low');
      expect(cafeteria.location.latitude, closeTo(48.14735, 0.0001));
      expect(cafeteria.location.longitude, closeTo(11.56774, 0.0001));
      expect(cafeteria.location.address, 'Arcisstraße 17, 80333 München');

      expect(cafeteria.openingHours, isNotNull);
      expect(cafeteria.openingHours!.mon?.start, '11:00');
      expect(cafeteria.openingHours!.fri?.end, '13:30');

      // Weekdays 1–5 all return (true, OpeningHour)
      // 2024-04-15 Mon, 2024-04-16 Tue … 2024-04-19 Fri, 2024-04-20 Sat
      expect(cafeteria.openingHoursForDate(DateTime(2024, 4, 15)).$1, isTrue); // Monday
      expect(cafeteria.openingHoursForDate(DateTime(2024, 4, 16)).$1, isTrue); // Tuesday
      expect(cafeteria.openingHoursForDate(DateTime(2024, 4, 17)).$1, isTrue); // Wednesday
      expect(cafeteria.openingHoursForDate(DateTime(2024, 4, 18)).$1, isTrue); // Thursday
      expect(cafeteria.openingHoursForDate(DateTime(2024, 4, 19)).$1, isTrue); // Friday
      expect(cafeteria.openingHoursForDate(DateTime(2024, 4, 20)).$1, isFalse); // Saturday
      expect(cafeteria.openingHoursForDate(DateTime(2024, 4, 21)).$1, isFalse); // Sunday
      // null date → default case
      expect(cafeteria.openingHoursForDate(null).$1, isFalse);
    });

    test('decodes a cafeteria without optional opening hours', () {
      final json = j('''
{
  "location": {"latitude": 48.265, "longitude": 11.668, "address": "Boltzmannstraße 15, 85748 Garching"},
  "name": "StuBistro Garching",
  "canteen_id": "stubistro-garching",
  "queue_status": null
}
''');
      final cafeteria = Cafeteria.fromJson(json);

      expect(cafeteria.openingHours, isNull);
      expect(cafeteria.queueStatusApi, isNull);
    });

    test('Cafeterias wrapper decodes list from "data" key', () {
      final json = j('''
{
  "data": [
    {
      "location": {"latitude": 48.14735, "longitude": 11.56774, "address": "Arcisstraße 17"},
      "name": "Mensa Arcisstraße",
      "canteen_id": "mensa-arcisstr",
      "queue_status": null
    },
    {
      "location": {"latitude": 48.265, "longitude": 11.668, "address": "Boltzmannstraße 15"},
      "name": "StuBistro Garching",
      "canteen_id": "stubistro-garching",
      "queue_status": null
    }
  ]
}
''');
      final cafeterias = Cafeterias.fromJson(json);

      expect(cafeterias.cafeterias.length, 2);
      expect(cafeterias.cafeterias[0].id, 'mensa-arcisstr');
      expect(cafeterias.cafeterias[1].id, 'stubistro-garching');
    });
  });

  group('Dish JSON decoding', () {
    test('decodes a dish with prices and labels', () {
      final json = j('''
{
  "name": "Schnitzel mit Pommes",
  "prices": {
    "students": {"base_price": 2.50, "price_per_unit": null, "unit": null},
    "staff":    {"base_price": 4.00, "price_per_unit": null, "unit": null}
  },
  "labels": ["veal", "gluten"],
  "dish_type": "Hauptspeise"
}
''');
      final dish = Dish.fromJson(json);

      expect(dish.name, 'Schnitzel mit Pommes');
      expect(dish.dishType, 'Hauptspeise');
      expect(dish.labels, containsAll(['veal', 'gluten']));
      expect(dish.prices['students']?.basePrice, closeTo(2.50, 0.001));
      expect(dish.prices['staff']?.basePrice, closeTo(4.00, 0.001));
    });

    test('decodes a dish with no labels', () {
      final json = j('''
{
  "name": "Apfelschorle",
  "prices": {},
  "labels": [],
  "dish_type": "Beilage"
}
''');
      final dish = Dish.fromJson(json);

      expect(dish.labels, isEmpty);
      expect(dish.prices, isEmpty);
    });
  });

  group('MealPlan / MensaMenu JSON decoding', () {
    test('decodes a weekly meal plan with multiple days', () {
      final json = j('''
{
  "number": 16,
  "year": 2024,
  "days": [
    {
      "date": "2024-04-15",
      "dishes": [
        {
          "name": "Pasta",
          "prices": {"students": {"base_price": 1.80}},
          "labels": ["vegan"],
          "dish_type": "Hauptspeise"
        }
      ]
    },
    {
      "date": "2024-04-16",
      "dishes": []
    }
  ]
}
''');
      final plan = MealPlan.fromJson(json);

      expect(plan.week, 16);
      expect(plan.year, 2024);
      expect(plan.days.length, 2);
      expect(plan.days[0].date, DateTime.parse('2024-04-15'));
      expect(plan.days[0].dishes.length, 1);
      expect(plan.days[0].dishes[0].name, 'Pasta');
      expect(plan.days[1].dishes, isEmpty);
    });

    test('decodes an empty meal plan', () {
      final json = j('{"number": 1, "year": 2024, "days": []}');
      final plan = MealPlan.fromJson(json);

      expect(plan.days, isEmpty);
    });
  });
}
