import 'dart:convert';

import 'package:xml2json/xml2json.dart';

import 'gradesTests.dart';

void main() {
  gradesTests();
}

dynamic xml2JsonConverter(String xml) {
  final transformer = Xml2Json()..parse(xml);
  final json = transformer.toParkerWithAttrsCustom(array: [
    "row",
    "event",
    "studium",
    "raeume",
    "gruppen",
    "telefon_nebenstellen",
  ]);
  return jsonDecode(json);
}
