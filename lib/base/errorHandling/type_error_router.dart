import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';

class TypeErrorRouter extends StatelessWidget with ErrorHandlingView {
  TypeErrorRouter({
    super.key,
    required this.typeError,
    required ErrorHandlingViewType errorHandlingViewType,
    Future<dynamic> Function(bool)? retry,
    Color? titleColor,
    Color? bodyColor,
  }) {
    this.errorHandlingViewType = errorHandlingViewType;
    this.retry = retry;
    this.titleColor = titleColor;
    this.bodyColor = bodyColor;
  }

  final TypeError typeError;

  @override
  Widget build(BuildContext context) {
    return exceptionMessage(
      context,
      context.localizations.decodingError,
      context.localizations.pleaseReport,
    );
  }
}
