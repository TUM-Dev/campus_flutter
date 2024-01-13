import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioExceptionRouter extends StatelessWidget with ErrorHandlingView {
  DioExceptionRouter({
    super.key,
    required this.dioException,
    required ErrorHandlingViewType errorHandlingViewType,
    Future<dynamic> Function(bool)? retry,
    Future<dynamic> Function(bool, BuildContext)? retryWithContext,
    Color? titleColor,
    Color? bodyColor,
  }) {
    this.errorHandlingViewType = errorHandlingViewType;
    this.retry = retry;
    this.retryWithContext = retryWithContext;
    this.titleColor = titleColor;
    this.bodyColor = bodyColor;
  }

  final DioException dioException;

  @override
  Widget build(BuildContext context) {
    switch (dioException.type) {
      case DioExceptionType.badResponse:
        return exceptionMessage(
          context,
          context.localizations.badResponse,
          context.localizations.pleaseTryAgain,
        );
      case DioExceptionType.connectionError:
        return exceptionMessage(
          context,
          context.localizations.connectionError,
          context.localizations.makeSureInternetConnection,
        );
      case DioExceptionType.cancel:
        return exceptionMessage(
          context,
          context.localizations.requestCancelled,
          context.localizations.pleaseReport,
        );
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return exceptionMessage(
          context,
          context.localizations.connectionTimeout,
          context.localizations.makeSureInternetConnection,
        );
      default:
        if (dioException.error.toString().contains("SocketException")) {
          return exceptionMessage(
            context,
            context.localizations.connectionError,
            context.localizations.makeSureInternetConnection,
          );
        } else {
          return exceptionMessage(
            context,
            context.localizations.unknownError,
            context.localizations.pleaseReport,
          );
        }
    }
  }
}
