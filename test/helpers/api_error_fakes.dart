import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/base/networking/base/api_response.dart';
import 'package:campus_flutter/base/networking/base/grpc_client.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/protocols/api_exception.dart';
import 'package:grpc/grpc.dart';

class ErrorRestClient implements RestClient {
  ErrorRestClient(this.failure, this.stack);
  final Object failure;
  final StackTrace stack;
  final forcedRefreshValues = <bool>[];
  Map<String, dynamic>? response;
  @override
  Future<ApiResponse<T>> get<T, S extends Api>(
    S endpoint,
    dynamic Function(Map<String, dynamic>) createObject,
    bool forcedRefresh,
  ) async {
    forcedRefreshValues.add(forcedRefresh);
    if (response != null) return ApiResponse(data: createObject(response!));
    Error.throwWithStackTrace(failure, stack);
  }

  @override
  Future<ApiResponse<T>>
  getWithException<T, S extends Api, U extends ApiException>(
    S endpoint,
    dynamic Function(Map<String, dynamic>) createObject,
    dynamic Function(Map<String, dynamic>) createError,
    bool forcedRefresh,
  ) async {
    if (response != null) return ApiResponse(data: createObject(response!));
    Error.throwWithStackTrace(failure, stack);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _ErrorCall<R> implements ClientCall<Object, R> {
  _ErrorCall(this.failure, this.stack);
  final Object failure;
  final StackTrace stack;
  @override
  Stream<R> get response => Stream.error(failure, stack);
  @override
  Future<Map<String, String>> get headers async => {};
  @override
  Future<Map<String, String>> get trailers async => {};
  @override
  Future<void> cancel() async {}
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ErrorGrpcClient implements GrpcClient {
  ErrorGrpcClient(this.failure, this.stack);
  final Object failure;
  final StackTrace stack;
  ResponseFuture<R> fail<R>() => ResponseFuture(_ErrorCall<R>(failure, stack));
  @override
  ResponseFuture<ListNewsReply> listNews(
    ListNewsRequest request, {
    CallOptions? options,
  }) => fail();
  @override
  ResponseFuture<ListMoviesReply> listMovies(
    ListMoviesRequest request, {
    CallOptions? options,
  }) => fail();
  @override
  ResponseFuture<ListStudentClubReply> listStudentClub(
    ListStudentClubRequest request, {
    CallOptions? options,
  }) => fail();
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
