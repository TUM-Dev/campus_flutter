import 'dart:async';

import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/networking/cache/cache_entry.dart';
import 'package:campus_flutter/base/networking/cache/grpc_cache_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';

import '../helpers/networking_fakes.dart';

class _FailedCall implements ClientCall<ListNewsRequest, ListNewsReply> {
  _FailedCall(this.failure);
  final GrpcError failure;
  @override
  Stream<ListNewsReply> get response => Stream.error(failure);
  @override
  Future<Map<String, String>> get headers async => {};
  @override
  Future<Map<String, String>> get trailers async => {};
  @override
  Future<void> cancel() async {}
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _PendingCall implements ClientCall<ListNewsRequest, ListNewsReply> {
  final reply = Completer<ListNewsReply>();
  bool cancelled = false;
  @override
  Stream<ListNewsReply> get response => Stream.fromFuture(reply.future);
  @override
  Future<Map<String, String>> get headers async => {'header': 'value'};
  @override
  Future<Map<String, String>> get trailers async => {'trailer': 'value'};
  @override
  Future<void> cancel() async {
    cancelled = true;
    if (!reply.isCompleted) reply.completeError(const GrpcError.cancelled());
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late CacheDatabase database;
  late MemoryCache cache;
  late GrpcCacheInterceptor interceptor;
  final method = ClientMethod<ListNewsRequest, ListNewsReply>(
    '/api.Campus/ListNews',
    (request) => request.writeToBuffer(),
    ListNewsReply.fromBuffer,
  );
  final request = ListNewsRequest();

  setUp(() {
    database = CacheDatabase();
    cache = MemoryCache();
    interceptor = GrpcCacheInterceptor(database)..cache = cache;
    cache.add(
      ListNewsReply(news: [News(title: 'cached')]).writeToJson(),
      GrpcCacheInterceptor.cacheKey(method.path, request),
    );
  });
  tearDown(() => database.close());

  Future<ListNewsReply> fetch(GrpcError failure) => interceptor.interceptUnary(
    method,
    request,
    CallOptions(),
    (method, request, options) => ResponseFuture(_FailedCall(failure)),
  );

  for (final failure in [
    const GrpcError.unavailable('offline'),
    const GrpcError.notFound(
      'HTTP connection completed with 404 instead of 200',
    ),
    const GrpcError.internal('server problem'),
    const GrpcError.deadlineExceeded('slow'),
  ]) {
    test('temporary gRPC status ${failure.code} uses stale data', () async {
      expect((await fetch(failure)).news.single.title, 'cached');
    });
  }
  for (final failure in [
    const GrpcError.permissionDenied('denied'),
    const GrpcError.unauthenticated('login'),
    const GrpcError.notFound('removed'),
    const GrpcError.cancelled('cancelled'),
    const GrpcError.unimplemented('unsupported'),
    const GrpcError.dataLoss('corrupt'),
  ]) {
    test(
      'gRPC status ${failure.code} remains visible despite stale data',
      () async {
        await expectLater(fetch(failure), throwsA(same(failure)));
      },
    );
  }
  test('network success preserves metadata and caches the result', () async {
    final call = _PendingCall();
    final result = interceptor.interceptUnary(
      method,
      request,
      CallOptions(),
      (method, request, options) => ResponseFuture(call),
    );
    call.reply.complete(ListNewsReply(news: [News(title: 'fresh')]));
    expect((await result).news.single.title, 'fresh');
    expect(await result.headers, {'header': 'value'});
    expect(await result.trailers, {'trailer': 'value'});
    expect(
      ListNewsReply.fromJson(cache.entries.values.single.body)
          .news
          .single
          .title,
      'fresh',
    );
  });

  test(
    'cancelling an active call propagates and never returns stale data',
    () async {
      final call = _PendingCall();
      final started = Completer<void>();
      final result = interceptor.interceptUnary(
        method,
        request,
        CallOptions(),
        (method, request, options) {
          started.complete();
          return ResponseFuture(call);
        },
      );
      final expectation = expectLater(
        result,
        throwsA(
          isA<GrpcError>().having(
            (error) => error.code,
            'code',
            StatusCode.cancelled,
          ),
        ),
      );
      await started.future;
      await result.cancel();
      await expectation;
      expect(call.cancelled, isTrue);
      expect(
        ListNewsReply.fromJson(cache.entries.values.single.body)
            .news
            .single
            .title,
        'cached',
      );
    },
  );

  test(
    'cancelling before lookup finishes prevents a network request',
    () async {
      var networkCalls = 0;
      final result = interceptor.interceptUnary(
        method,
        request,
        CallOptions(),
        (method, request, options) {
          networkCalls++;
          return ResponseFuture(_FailedCall(const GrpcError.unavailable()));
        },
      );
      final expectation = expectLater(
        result,
        throwsA(
          isA<GrpcError>().having(
            (error) => error.code,
            'code',
            StatusCode.cancelled,
          ),
        ),
      );
      await result.cancel();
      await expectation;
      expect(networkCalls, 0);
    },
  );

  test('no cached result still delivers the original network error', () async {
    cache.entries.clear();
    const failure = GrpcError.internal('failure');
    await expectLater(fetch(failure), throwsA(same(failure)));
  });

  test(
    'the reported HTTP/2 UNKNOWN error reaches the caller unchanged',
    () async {
      const failure = GrpcError.unknown(
        'HTTP/2 error: Connection error: Connection is being forcefully '
        'terminated. (errorCode: 10)',
      );
    // UNKNOWN failures must reach callers unless a recovery policy is explicit.
      await expectLater(fetch(failure), throwsA(same(failure)));
      cache.entries.clear();
      await expectLater(fetch(failure), throwsA(same(failure)));
    },
  );
}
