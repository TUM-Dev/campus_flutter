import 'dart:convert';
import 'package:xml2json/xml2json.dart';

/// Mirrors the [RestClient] response decoder exactly:
/// parses XML with [Xml2Json] and converts it to a Dart [Map] using
/// [toParkerWithAttrs] with the same plural-key mappings used in production.
Map<String, dynamic> xmlToJson(
  String xml, {
  Map<String, String> entries = const {},
}) {
  final transformer = Xml2Json();
  transformer.parse(xml);
  final jsonString = transformer.toParkerWithAttrs(entries: entries);
  return jsonDecode(jsonString) as Map<String, dynamic>;
}

/// The exact plural-key mappings configured in [RestClient].
const Map<String, String> tumOnlineEntries = {
  "row": "rowset",
  "event": "events",
  "studium": "studien",
  "raum": "raeume",
  "gruppe": "gruppen",
  "nebenstelle": "telefon_nebenstellen",
  "card": "cards",
};

/// Convenience wrapper: decode TUM Online XML using all production mappings.
Map<String, dynamic> tumXmlToJson(String xml) =>
    xmlToJson(xml, entries: tumOnlineEntries);
