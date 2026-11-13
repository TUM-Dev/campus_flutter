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
    final title = tumOnlineApiException.message(context, ref);
    final recovery = tumOnlineApiException.recoverySuggestion(context, ref);
    final compactNotice =
        tumOnlineApiException.serviceMessage != null &&
        (errorHandlingViewType == ErrorHandlingViewType.descriptionOnly ||
            errorHandlingViewType == ErrorHandlingViewType.redDescriptionOnly);
    return exceptionMessage(
      errorMessage: compactNotice ? '$title\n\n$recovery' : title,
      fixMessage: recovery,
      retry: tumOnlineApiException.overwriteRetry(context) ?? retry,
      retryMessage: tumOnlineApiException.overwriteRetryMessage(context),
      allowRetry: tumOnlineApiException.canRetry,
      context: context,
    );
  }
}
