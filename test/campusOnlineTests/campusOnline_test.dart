import 'dart:convert';

import 'package:xml2json/xml2json.dart';

import 'gradesTests.dart';

void main() {
  gradesTests();
}

dynamic xml2JsonConverter(String xml) {
  final transformer = Xml2Json()..parse(xml);
  final json = transformer.toParkerWithAttrs(
    entries: {
      "row": "rowset",
      "event": "events",
      "studium": "studien",
      "raum": "raeume",
      "gruppe": "gruppen",
      "nebenstelle": "telefon_nebenstellen",
      "card": "cards",
    },
  );
  return jsonDecode(json);
}
