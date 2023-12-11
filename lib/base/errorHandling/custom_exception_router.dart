import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_view.dart';
import 'package:campus_flutter/base/extensions/custom_exception.dart';
import 'package:flutter/material.dart';

class CustomExceptionRouter extends StatelessWidget with ErrorHandlingView {
  CustomExceptionRouter({
    super.key,
    required this.customException,
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

  final CustomException customException;

  @override
  Widget build(BuildContext context) {
    return exceptionMessage(context, customException.message, null);
  }
}
