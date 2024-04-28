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
    Function()? retry,
    Color? titleColor,
    Color? bodyColor,
  }) {
    this.errorHandlingViewType = errorHandlingViewType;
    this.retry = retry;
    this.titleColor = titleColor;
    this.bodyColor = bodyColor;
  }

  final DioException dioException;

  @override
  Widget build(BuildContext context) {
    switch (dioException.type) {
      case DioExceptionType.badResponse:
        return exceptionMessage(
          errorMessage: context.localizations.badResponse,
          fixMessage: context.localizations.pleaseTryAgain,
          context: context,
        );
      case DioExceptionType.connectionError:
        return exceptionMessage(
          errorMessage: context.localizations.connectionError,
          fixMessage: context.localizations.makeSureInternetConnection,
          context: context,
        );
      case DioExceptionType.cancel:
        return exceptionMessage(
          errorMessage: context.localizations.requestCancelled,
          fixMessage: context.localizations.pleaseReport,
          context: context,
        );
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return exceptionMessage(
          errorMessage: context.localizations.connectionTimeout,
          fixMessage: context.localizations.makeSureInternetConnection,
          context: context,
        );
      default:
        if (dioException.error.toString().contains("SocketException")) {
          return exceptionMessage(
            fixMessage: context.localizations.connectionError,
            errorMessage: context.localizations.makeSureInternetConnection,
            context: context,
          );
        } else {
          return exceptionMessage(
            fixMessage: context.localizations.unknownError,
            errorMessage: context.localizations.pleaseReport,
            context: context,
          );
        }
    }
  }
}
