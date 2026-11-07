import 'package:campus_flutter/base/errorHandling/api_failure.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/default_error_router.dart';
import 'package:campus_flutter/base/errorHandling/dio_exception_router.dart';
import 'package:campus_flutter/base/errorHandling/grpc_error_router.dart';
import 'package:campus_flutter/base/errorHandling/search_exception_router.dart';
import 'package:campus_flutter/base/errorHandling/tum_online_api_exception_router.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class ErrorHandlingRouter extends StatefulWidget {
  const ErrorHandlingRouter({
    super.key,
    required this.error,
    required this.errorHandlingViewType,
    this.retry,
    this.isMutation = false,
    this.titleColor,
    this.bodyColor,
  });

  final Object? error;
  final ErrorHandlingViewType errorHandlingViewType;
  final Function()? retry;

  /// Set for writes whose outcome can be uncertain when no reply arrives.
  final bool isMutation;
  final Color? titleColor;
  final Color? bodyColor;

  @override
  State<ErrorHandlingRouter> createState() => _ErrorHandlingRouterState();
}

class _ErrorHandlingRouterState extends State<ErrorHandlingRouter> {
  @override
  void initState() {
    super.initState();
    _reportUnexpectedError();
  }

  @override
  void didUpdateWidget(covariant ErrorHandlingRouter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.error, widget.error)) _reportUnexpectedError();
  }

  void _reportUnexpectedError() {
    final error = widget.error;
    final unexpected = error is TumOnlineApiException
        ? error.tumOnlineApiExceptionType is TumOnlineApiExceptionUnknown
        : error is! SearchException && ApiFailure.from(error).shouldReport;
    if (!kDebugMode && error != null && unexpected) {
      // Never send request URLs, tokens, response bodies or server messages.
      FirebaseCrashlytics.instance.recordError(
        'API failure: ${error.runtimeType} (${ApiFailure.from(error).name})',
        error is Error ? error.stackTrace : StackTrace.current,
        fatal: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final error = widget.error;
    final errorHandlingViewType = widget.errorHandlingViewType;
    final retry = widget.retry;
    final titleColor = widget.titleColor;
    final bodyColor = widget.bodyColor;
    switch (error) {
      case DioException dioException:
        return DioExceptionRouter(
          dioException: dioException,
          isMutation: widget.isMutation,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      case TumOnlineApiException tumOnlineApiException:
        return TumOnlineApiExceptionRouter(
          tumOnlineApiException: tumOnlineApiException,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      case SearchException searchException:
        return SearchExceptionRouter(
          searchException: searchException,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      case GrpcError grpcError:
        return GrpcErrorRouter(
          grpcError: grpcError,
          isMutation: widget.isMutation,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
      default:
        return DefaultErrorRouter(
          exception: error,
          isMutation: widget.isMutation,
          errorHandlingViewType: errorHandlingViewType,
          retry: retry,
          titleColor: titleColor,
          bodyColor: bodyColor,
        );
    }
  }
}
