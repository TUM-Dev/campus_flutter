import 'package:campus_flutter/base/routing/routes.dart';

/// Converts a geo search link into an internal room-search location.
/// Accepts both `geo:0,0?q=...` and `geo://0,0?q=...` links.
String? geoSearchLocation(Uri uri) {
  if (uri.scheme != 'geo') return null;

  try {
    final queries = uri.queryParametersAll['q'];
    if (queries == null || queries.length != 1) return null;
    final query = queries.single.trim();
    if (query.isEmpty) return null;

    return Uri(path: roomSearch, queryParameters: {'q': query}).toString();
  } on FormatException {
    return null;
  }
}
