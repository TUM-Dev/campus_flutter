import 'package:isar/isar.dart';

part 'cache_entry.g.dart';

@collection
class CacheEntry {
  final Id id;
  final String url;
  final DateTime validUntil;
  final DateTime saved;
  final String data;

  CacheEntry({
    required this.id,
    required this.url,
    required this.validUntil,
    required this.saved,
    required this.data,
  });
}
