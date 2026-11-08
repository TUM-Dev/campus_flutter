import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:grpc/grpc.dart';
import 'package:xml2json/xml2json.dart';

/// Transport-independent presentation and recovery policy. Server messages and
/// request URLs deliberately stay out of user-facing text and crash reports.
enum ApiFailure {
  connection('connectionError', 'makeSureInternetConnection'),
  timeout('apiRequestTimeout', 'apiTryLater'),
  cancelled('requestCancelled', 'pleaseTryAgain', retryable: false),
  unauthorized('apiUnauthorized', 'apiUnauthorizedRecovery', retryable: false),
  forbidden('noPermission', 'apiForbiddenRecovery', retryable: false),
  notFound('apiNotFound', 'apiNotFoundRecovery', retryable: false),
  invalidRequest(
    'apiInvalidRequest',
    'apiInvalidRequestRecovery',
    retryable: false,
  ),
  conflict('apiConflict', 'apiConflictRecovery', retryable: false),
  alreadyExists(
    'apiAlreadyExists',
    'apiAlreadyExistsRecovery',
    retryable: false,
  ),
  unsupported('apiUnsupported', 'apiUnsupportedRecovery', retryable: false),
  rateLimited('rateExceeded', 'rateExceededRecovery'),
  unavailable('apiUnavailable', 'apiTryLater'),
  serverError('apiServerError', 'apiTryLater'),
  gateway('apiGatewayError', 'apiServiceRecovery'),
  serviceTimeout('apiServiceTimeout', 'apiServiceRecovery'),
  certificate(
    'apiSecureConnection',
    'apiSecureConnectionRecovery',
    retryable: false,
  ),
  decoding('decodingError', 'pleaseTryAgain'),
  unknown('unknownError', 'pleaseReport');

  const ApiFailure(this.messageKey, this.recoveryKey, {this.retryable = true});

  final String messageKey;
  final String recoveryKey;
  final bool retryable;

  bool get shouldReport => this == decoding || this == unknown;

  /// Only temporary transport/server failures may be hidden by stale data.
  bool get allowsStale =>
      this == connection ||
      this == timeout ||
      this == unavailable ||
      this == serverError ||
      this == gateway ||
      this == serviceTimeout ||
      this == rateLimited;

  /// Missing a reply does not prove that a write was rejected by the server.
  bool get mayHaveCompleted => switch (this) {
    connection ||
    timeout ||
    unavailable ||
    serverError ||
    gateway ||
    serviceTimeout ||
    decoding ||
    unknown => true,
    _ => false,
  };

  String recoveryKeyFor({required bool isMutation}) =>
      isMutation && mayHaveCompleted
      ? 'apiSubmissionUncertainRecovery'
      : recoveryKey;

  bool canRetry({required bool isMutation}) =>
      retryable && !(isMutation && mayHaveCompleted);

  static ApiFailure from(Object? error) {
    if (error is DioException) {
      return switch (error.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout => timeout,
        DioExceptionType.connectionError => connection,
        DioExceptionType.cancel => cancelled,
        DioExceptionType.badCertificate => certificate,
        DioExceptionType.transformTimeout => decoding,
        DioExceptionType.badResponse => fromHttpStatus(
          error.response?.statusCode,
        ),
        DioExceptionType.unknown => from(error.error),
      };
    }
    if (error is GrpcError) {
      // This fork maps a plain HTTP 404 to NOT_FOUND before receiving a gRPC
      // status. Its exact generated message is the only discriminator exposed
      // by the native client; do not reinterpret ordinary domain NOT_FOUNDs.
      if (error.code == StatusCode.notFound &&
          error.message ==
              'HTTP connection completed with 404 instead of 200') {
        return unavailable;
      }
      return switch (error.code) {
        StatusCode.cancelled => cancelled,
        StatusCode.deadlineExceeded => timeout,
        StatusCode.unauthenticated => unauthorized,
        StatusCode.permissionDenied => forbidden,
        StatusCode.notFound => notFound,
        StatusCode.invalidArgument ||
        StatusCode.outOfRange ||
        StatusCode.failedPrecondition => invalidRequest,
        StatusCode.alreadyExists => alreadyExists,
        StatusCode.aborted => conflict,
        StatusCode.resourceExhausted => rateLimited,
        StatusCode.unimplemented => unsupported,
        StatusCode.unavailable => unavailable,
        StatusCode.internal => serverError,
        StatusCode.dataLoss => decoding,
        _ => unknown,
      };
    }
    if (error is SocketException) return connection;
    if (error is TimeoutException) return timeout;
    if (error is HandshakeException) return certificate;
    if (error is FormatException ||
        error is TypeError ||
        error is Xml2JsonException) {
      return decoding;
    }
    return unknown;
  }

  static ApiFailure fromHttpStatus(int? status) => switch (status) {
    400 || 405 || 413 || 422 => invalidRequest,
    401 => unauthorized,
    403 => forbidden,
    404 || 410 => notFound,
    408 => timeout,
    409 || 412 => conflict,
    429 => rateLimited,
    501 || 505 => unsupported,
    502 => gateway,
    503 => unavailable,
    504 => serviceTimeout,
    int code when code >= 500 && code <= 599 => serverError,
    _ => unknown,
  };
}
