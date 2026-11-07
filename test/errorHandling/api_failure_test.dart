import 'dart:async';
import 'dart:io';

import 'package:campus_flutter/base/errorHandling/api_failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart' hide Response;

void main() {
  test('HTTP status codes distinguish actionable failures', () {
    const cases = {
      400: ApiFailure.invalidRequest,
      401: ApiFailure.unauthorized,
      403: ApiFailure.forbidden,
      404: ApiFailure.notFound,
      408: ApiFailure.timeout,
      409: ApiFailure.conflict,
      422: ApiFailure.invalidRequest,
      429: ApiFailure.rateLimited,
      500: ApiFailure.unavailable,
      502: ApiFailure.unavailable,
      503: ApiFailure.unavailable,
      504: ApiFailure.timeout,
    };
    for (final entry in cases.entries) {
      final options = RequestOptions(path: '/');
      final error = DioException.badResponse(
        statusCode: entry.key,
        requestOptions: options,
        response: Response(requestOptions: options, statusCode: entry.key),
      );
      expect(ApiFailure.from(error), entry.value, reason: '${entry.key}');
    }
  });

  test('gRPC codes use safe localized categories rather than server text', () {
    const cases = {
      StatusCode.cancelled: ApiFailure.cancelled,
      StatusCode.deadlineExceeded: ApiFailure.timeout,
      StatusCode.unauthenticated: ApiFailure.unauthorized,
      StatusCode.permissionDenied: ApiFailure.forbidden,
      StatusCode.notFound: ApiFailure.notFound,
      StatusCode.invalidArgument: ApiFailure.invalidRequest,
      StatusCode.outOfRange: ApiFailure.invalidRequest,
      StatusCode.failedPrecondition: ApiFailure.invalidRequest,
      StatusCode.alreadyExists: ApiFailure.alreadyExists,
      StatusCode.aborted: ApiFailure.conflict,
      StatusCode.resourceExhausted: ApiFailure.rateLimited,
      StatusCode.internal: ApiFailure.unavailable,
      StatusCode.unavailable: ApiFailure.unavailable,
      StatusCode.unimplemented: ApiFailure.unsupported,
      StatusCode.dataLoss: ApiFailure.decoding,
      StatusCode.unknown: ApiFailure.unknown,
    };
    for (final entry in cases.entries) {
      expect(
        ApiFailure.from(GrpcError.custom(entry.key, 'secret server detail')),
        entry.value,
        reason: '${entry.key}',
      );
    }
  });

  test('handles every Dio transport category and wrapped native errors', () {
    const cases = {
      DioExceptionType.connectionTimeout: ApiFailure.timeout,
      DioExceptionType.sendTimeout: ApiFailure.timeout,
      DioExceptionType.receiveTimeout: ApiFailure.timeout,
      DioExceptionType.connectionError: ApiFailure.connection,
      DioExceptionType.cancel: ApiFailure.cancelled,
      DioExceptionType.badCertificate: ApiFailure.certificate,
      DioExceptionType.unknown: ApiFailure.unknown,
      DioExceptionType.transformTimeout: ApiFailure.decoding,
    };
    for (final entry in cases.entries) {
      expect(
        ApiFailure.from(
          DioException(requestOptions: RequestOptions(), type: entry.key),
        ),
        entry.value,
      );
    }
    expect(
      ApiFailure.from(
        DioException(
          requestOptions: RequestOptions(),
          error: const SocketException('offline'),
        ),
      ),
      ApiFailure.connection,
    );
    expect(ApiFailure.from(TimeoutException('timeout')), ApiFailure.timeout);
    expect(ApiFailure.from(const HandshakeException()), ApiFailure.certificate);
    expect(ApiFailure.from(const FormatException()), ApiFailure.decoding);
  });

  test('stale fallback is limited to temporary failures', () {
    for (final failure in ApiFailure.values) {
      expect(
        failure.allowsStale,
        {
          ApiFailure.connection,
          ApiFailure.timeout,
          ApiFailure.unavailable,
          ApiFailure.rateLimited,
        }.contains(failure),
      );
    }
    expect(ApiFailure.unauthorized.retryable, isFalse);
    expect(ApiFailure.cancelled.shouldReport, isFalse);
    expect(ApiFailure.connection.shouldReport, isFalse);
    expect(ApiFailure.decoding.shouldReport, isTrue);
  });
}
