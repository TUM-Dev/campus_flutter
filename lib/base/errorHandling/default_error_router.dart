import 'package:campus_flutter/base/errorHandling/api_failure.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DefaultErrorRouter extends StatelessWidget with ErrorHandlingView {
  DefaultErrorRouter({
    super.key,
    required this.exception,
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

  final Object? exception;

  final bool isMutation;

  @override
  Widget build(BuildContext context) {
    final failure = ApiFailure.from(exception);
    final mutation = isMutation;
    return exceptionMessage(
      errorMessage: context.tr(failure.messageKey),
      fixMessage: context.tr(failure.recoveryKeyFor(isMutation: mutation)),
      allowRetry: failure.canRetry(isMutation: mutation),
      context: context,
    );
  }
}
