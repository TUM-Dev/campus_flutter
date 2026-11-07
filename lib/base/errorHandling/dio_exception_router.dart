import 'package:campus_flutter/base/errorHandling/api_failure.dart';
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
    final failure = ApiFailure.from(dioException);
    return exceptionMessage(
      errorMessage: context.tr(failure.messageKey),
      fixMessage: context.tr(failure.recoveryKey),
      allowRetry: failure.retryable,
      context: context,
    );
  }
}
