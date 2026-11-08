import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> showErrorDialog(
  BuildContext context,
  Object error,
  StackTrace stackTrace, {
  bool isMutation = false,
}) => showDialog<void>(
  context: context,
  builder: (dialogContext) => AlertDialog(
    content: ErrorHandlingRouter(
      error: error,
      stackTrace: stackTrace,
      isMutation: isMutation,
      errorHandlingViewType: ErrorHandlingViewType.textOnly,
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(dialogContext).pop(),
        child: Text(dialogContext.tr('back')),
      ),
    ],
  ),
);
