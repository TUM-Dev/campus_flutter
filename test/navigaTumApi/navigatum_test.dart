import 'dart:convert';

import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api.dart';
import 'package:campus_flutter/base/networking/apis/navigaTumApi/navigatum_api_endpoint.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_details.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_entity.dart';
import 'package:campus_flutter/navigaTumComponent/model/search/navigatum_search_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, dynamic> j(String s) => jsonDecode(s) as Map<String, dynamic>;

  test('requests only rooms while preserving the search query', () {
    const query = 'Garching & Audimax';
    final uri = NavigaTumApi(
      navigaTumApiEndpoint: NavigaTumApiEndpointSearch(
        query: query,
        type: 'room',
      ),
    ).asURL();

    expect(uri.path, '/api/search');
    expect(uri.queryParameters, {'q': query, 'type': 'room'});
  });

  group('NavigaTumSearchResponse JSON decoding', () {
    test(
      'decodes unfiltered room and lecture results without mutating input',
      () {
        final json = {
          'sections': [
            {
              'facet': 'rooms',
              'entries': [
                {
                  'id': '0509.EG.980',
                  'type': 'room',
                  'name': '0509.EG.980 (Audimax)',
                  'subtext': 'stammgelände, Wienandsbau',
                },
              ],
            },
            {
              'facet': 'lectures',
              'entries': [
                {
                  'id': 'lecture_59fa470af0528c72',
                  'name':
                      '\u0019Aud\u0017io Artificial Intelligence for Automotive Systems',
                  'subtext': 'Vorlesung',
                  'title_de':
                      'Audio Artificial Intelligence for Automotive Systems',
                  'title_en':
                      'Audio Artificial Intelligence for Automotive Systems',
                  'next_occurrence_at': '2026-10-26T15:00:00Z',
                  'upcoming': [
                    {
                      'start_at': '2026-10-26T15:00:00Z',
                      'end_at': '2026-10-26T16:30:00Z',
                      'room_code': '5504.01.442',
                      'room_name': '5504.01.442 (Studentenpraktika mit PC)',
                    },
                  ],
                },
              ],
            },
          ],
        };
        final original = jsonEncode(json);

        final response = NavigaTumSearchResponse.fromJson(json);

        expect(response.sections.map((s) => s.type), ['rooms', 'lectures']);
        expect(response.sections.first.entries.single.type, 'room');
        final lecture = response.sections.last.entries.single;
        expect(lecture.type, 'lecture');
        expect(
          lecture.getFormattedName(),
          'Audio Artificial Intelligence for Automotive Systems',
        );
        expect(jsonEncode(json), original);
      },
    );

    test('decodes a search response with multiple sections', () {
      final json = j('''
{
  "sections": [
    {
      "facet": "rooms",
      "entries": [
        {
          "id": "5606.EG.001",
          "type": "room",
          "name": "MI 00.08.038",
          "subtext": "lecture hall"
        },
        {
          "id": "5602.EG.001",
          "type": "room",
          "name": "MI 00.06.011",
          "subtext": "seminar room",
          "parsed_id": "Room 011"
        }
      ]
    },
    {
      "facet": "buildings",
      "entries": [
        {
          "id": "mi",
          "type": "building",
          "name": "Informatik (MI)",
          "subtext": "Garching"
        }
      ]
    }
  ]
}
''');
      final response = NavigaTumSearchResponse.fromJson(json);

      expect(response.sections.length, 2);

      final rooms = response.sections[0];
      expect(rooms.type, 'rooms');
      expect(rooms.entries.length, 2);
      expect(rooms.entries[0].id, '5606.EG.001');
      expect(rooms.entries[0].name, 'MI 00.08.038');
      expect(rooms.entries[0].subtext, 'lecture hall');
      expect(rooms.entries[0].parsedId, isNull);
      expect(rooms.entries[1].parsedId, 'Room 011');

      final buildings = response.sections[1];
      expect(buildings.type, 'buildings');
      expect(buildings.entries.length, 1);
    });

    test('decodes an empty sections list', () {
      final json = j('{"sections": []}');
      final response = NavigaTumSearchResponse.fromJson(json);

      expect(response.sections, isEmpty);
    });
  });

  group('NavigaTumNavigationEntity', () {
    NavigaTumNavigationEntity makeEntity({
      String name = 'Test Room',
      String subtext = 'floor',
      String? parsedId,
    }) =>
        NavigaTumNavigationEntity.fromJson({
          'id': 'test-id',
          'type': 'room',
          'name': name,
          'subtext': subtext,
          'parsed_id': ?parsedId,
        });

    test('getFormattedName returns name only when parsedId is null', () {
      final entity = makeEntity(name: 'Informatik (MI)');
      expect(entity.getFormattedName(), 'Informatik (MI)');
    });

    test('getFormattedName includes parsedId when present', () {
      final entity = makeEntity(name: 'MI 00.08.038', parsedId: '5606.EG.001');
      expect(entity.getFormattedName(), '5606.EG.001 ➤ MI 00.08.038');
    });

    test('getFormattedName strips NavigaTum highlight control characters', () {
      // DC1 (\u0017) and DC3 (\u0019) are used by NavigaTum to mark highlights
      final entity = makeEntity(name: '\u0019MI\u0017 00.08.038');
      expect(entity.getFormattedName(), 'MI 00.08.038');
    });
  });

  group('NavigaTumNavigationDetails JSON decoding', () {
    test('decodes a full location detail response', () {
      final json = j('''
{
  "id": "5606.EG.001",
  "name": "MI 00.08.038",
  "parent_names": ["Garching", "Informatik (MI)", "EG"],
  "type": "room",
  "type_common_name": "Lecture Hall",
  "props": {
    "computed": [
      {"name": "Seats", "text": "200"},
      {"name": "Building", "text": "MI"}
    ]
  },
  "coords": {
    "lat": 48.26244,
    "lon": 11.66773
  },
  "maps": {
    "default": "rf142",
    "roomfinder": {
      "default": "rf142",
      "available": [
        {
          "id": "rf142",
          "name": "EG",
          "file": "rf142.webp",
          "height": 744,
          "width": 1052,
          "x": 527,
          "y": 363,
          "scale": "1:1000"
        }
      ]
    },
    "overlays": {
      "available": [
        {"id": 1, "floor": "EG", "file": "overlay_eg.webp", "name": "Ground Floor"}
      ]
    }
  }
}
''');
      final details = NavigaTumNavigationDetails.fromJson(json);

      expect(details.id, '5606.EG.001');
      expect(details.name, 'MI 00.08.038');
      expect(details.parentNames, ['Garching', 'Informatik (MI)', 'EG']);
      expect(details.type, 'room');
      expect(details.typeCommonName, 'Lecture Hall');

      // Coordinates
      expect(details.coordinates.latitude, closeTo(48.26244, 0.0001));
      expect(details.coordinates.longitude, closeTo(11.66773, 0.0001));
      expect(details.hasCoordinates, isTrue);

      // Additional properties
      expect(details.additionalProperties.properties.length, 2);
      expect(details.additionalProperties.properties[0].name, 'Seats');
      expect(details.additionalProperties.properties[0].text, '200');

      // Maps
      expect(details.maps.defaultMapId, 'rf142');
      expect(details.maps.roomfinder?.defaultMapId, 'rf142');
      expect(details.maps.roomfinder?.available.length, 1);
      expect(details.maps.roomfinder?.available[0].imageUrl, 'rf142.webp');
      expect(details.maps.overlays?.available.length, 1);
      expect(details.maps.overlays?.available[0].floor, 'EG');
    });

    test('hasCoordinates is false when lat/lon are null', () {
      final json = j('''
{
  "id": "mi",
  "name": "Informatik (MI)",
  "parent_names": ["Garching"],
  "type": "building",
  "type_common_name": "Building",
  "props": {"computed": []},
  "coords": {},
  "maps": {"default": "rf000"}
}
''');
      final details = NavigaTumNavigationDetails.fromJson(json);

      expect(details.hasCoordinates, isFalse);
    });
  });
}
