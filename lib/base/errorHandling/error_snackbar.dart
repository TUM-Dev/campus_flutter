import 'package:campus_flutter/base/errorHandling/api_failure.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:dio/dio.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Shows the latest error without blocking interaction or queuing old messages.
void showErrorSnackBar(
  BuildContext context,
  Object error, {
  StackTrace? stackTrace,
  bool isMutation = false,
  VoidCallback? retry,
}) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.removeCurrentSnackBar();
  final domainError = error is TumOnlineApiException ? error : null;
  final mutation =
      isMutation ||
      (error is DioException &&
          (error.requestOptions.extra[Api.mutationKey] == true ||
              !{
                'GET',
                'HEAD',
                'OPTIONS',
              }.contains(error.requestOptions.method.toUpperCase())));
  final retryAllowed =
      domainError?.canRetry ??
      ApiFailure.from(error).canRetry(isMutation: mutation);
  final callback =
      domainError?.overwriteRetry(context) ?? (retryAllowed ? retry : null);
  messenger.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 10),
      showCloseIcon: true,
      action: callback == null
          ? null
          : SnackBarAction(
              label:
                  domainError?.overwriteRetryMessage(context) ??
                  context.tr('tryAgain'),
              onPressed: () => callback(),
            ),
      content: ErrorHandlingRouter(
        error: error,
        stackTrace: stackTrace,
        isMutation: mutation,
        errorHandlingViewType: ErrorHandlingViewType.snackBar,
      ),
    ),
  );
}
