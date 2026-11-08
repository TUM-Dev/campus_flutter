import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Shows the latest error without blocking interaction or queuing old messages.
void showErrorSnackBar(
  BuildContext context,
  Object error, {
  VoidCallback? retry,
}) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.removeCurrentSnackBar();
  final domainError = error is TumOnlineApiException ? error : null;
  final callback = domainError?.overwriteRetry(context) ?? retry;
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
        errorHandlingViewType: ErrorHandlingViewType.snackBar,
      ),
    ),
  );
}
