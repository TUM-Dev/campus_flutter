import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_view.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
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
          errorMessage: context.tr("badResponse"),
          fixMessage: context.tr("pleaseTryAgain"),
          context: context,
        );
      case DioExceptionType.connectionError:
        return exceptionMessage(
          errorMessage: context.tr("connectionError"),
          fixMessage: context.tr("makeSureInternetConnection"),
          context: context,
        );
      case DioExceptionType.cancel:
        return exceptionMessage(
          errorMessage: context.tr("requestCancelled"),
          fixMessage: context.tr("pleaseReport"),
          context: context,
        );
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return exceptionMessage(
          errorMessage: context.tr("connectionTimeout"),
          fixMessage: context.tr("makeSureInternetConnection"),
          context: context,
        );
      default:
        if (dioException.error.toString().contains("SocketException")) {
          return exceptionMessage(
            fixMessage: context.tr("connectionError"),
            errorMessage: context.tr("makeSureInternetConnection"),
            context: context,
          );
        } else {
          return exceptionMessage(
            fixMessage: context.tr("unknownError"),
            errorMessage: context.tr("pleaseReport"),
            context: context,
          );
        }
    }
  }
}
