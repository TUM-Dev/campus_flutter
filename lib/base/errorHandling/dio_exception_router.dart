import 'package:campus_flutter/base/networking/protocols/api.dart';
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
    this.isMutation = false,
    Color? titleColor,
    Color? bodyColor,
  }) {
    this.errorHandlingViewType = errorHandlingViewType;
    this.retry = retry;
    this.titleColor = titleColor;
    this.bodyColor = bodyColor;
  }

  final DioException dioException;

  final bool isMutation;

  @override
  Widget build(BuildContext context) {
    final failure = ApiFailure.from(dioException);
    final options = dioException.requestOptions;
    final mutation =
        isMutation ||
        options.extra[Api.mutationKey] == true ||
        !{'GET', 'HEAD', 'OPTIONS'}.contains(options.method.toUpperCase());
    return exceptionMessage(
      errorMessage: context.tr(failure.messageKey),
      fixMessage: context.tr(failure.recoveryKeyFor(isMutation: mutation)),
      allowRetry: failure.canRetry(isMutation: mutation),
      context: context,
    );
  }
}
