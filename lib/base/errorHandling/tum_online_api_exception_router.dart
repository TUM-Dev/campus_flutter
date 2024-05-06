import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_view.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TumOnlineApiExceptionRouter extends ConsumerWidget
    with ErrorHandlingView {
  TumOnlineApiExceptionRouter({
    super.key,
    required this.tumOnlineApiException,
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

  final TumOnlineApiException tumOnlineApiException;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return exceptionMessage(
      errorMessage: tumOnlineApiException.message(context, ref),
      fixMessage: tumOnlineApiException.recoverySuggestion(context, ref),
      retry: tumOnlineApiException.overwriteRetry(context) ?? retry,
      retryMessage: tumOnlineApiException.overwriteRetryMessage(context),
      context: context,
    );
  }
}
