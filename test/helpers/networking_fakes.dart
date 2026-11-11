import 'dart:typed_data';

import 'package:campus_flutter/base/networking/cache/cache.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:dio/dio.dart';

class MemoryCache implements Cache {
  final entries = <String, CacheEntryData>{};
  @override
  Future<CacheEntryData?> get(String key) async => entries[key];
  @override
  bool isFresh(CacheEntryData entry, String key) => false;
  @override
  void add(String body, String key) => entries[key] = CacheEntryData(
    id: 1,
    url: key,
    body: body,
    saved: DateTime.now(),
    validUntil: DateTime.now().add(const Duration(days: 1)),
  );
  @override
  void delete(String key) => entries.remove(key);
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class StubAdapter implements HttpClientAdapter {
  StubAdapter(this.reply);
  final ResponseBody Function(RequestOptions) reply;
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? stream,
    Future<void>? cancelFuture,
  ) async => reply(options);
  @override
  void close({bool force = false}) {}
}
