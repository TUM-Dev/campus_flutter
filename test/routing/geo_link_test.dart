import 'package:campus_flutter/base/routing/geo_link.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final link in [
    'geo:0,0?q=5602.EG.001',
    'geo://0,0?q=5602.EG.001',
    'geo:48.262444,11.669094?q=5602.EG.001&z=18',
  ]) {
    test('opens the room query from $link', () {
      final location = Uri.parse(geoSearchLocation(Uri.parse(link))!);
      expect(location.path, roomSearch);
      expect(location.queryParameters, {'q': '5602.EG.001'});
    });
  }

  test('keeps encoded text as a single search query', () {
    const query = 'Hörsaal A & B + C /search?q=other #1';
    final link = Uri.parse('geo:0,0?q=${Uri.encodeComponent(query)}');
    final location = Uri.parse(geoSearchLocation(link)!);
    expect(location.path, roomSearch);
    expect(location.queryParameters, {'q': query});
    expect(location.fragment, isEmpty);
  });

  test('decodes the incoming query only once and trims surrounding spaces', () {
    final link = Uri.parse('geo:0,0?q=%20Room%252FA%20');
    final location = Uri.parse(geoSearchLocation(link)!);
    expect(location.queryParameters['q'], 'Room%2FA');
  });

  for (final link in [
    'https://example.com/?q=5602.EG.001',
    'geo:48.262444,11.669094',
    'geo:0,0?q=',
    'geo:0,0?q=%20%20',
    'geo:0,0?q=first&q=second',
    'geo:0,0?q=%FF',
  ]) {
    test('ignores unsupported or invalid search link $link', () {
      expect(geoSearchLocation(Uri.parse(link)), isNull);
    });
  }
}
