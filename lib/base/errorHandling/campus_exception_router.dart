import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_view.dart';
import 'package:campus_flutter/base/extensions/campus_exception.dart';
import 'package:flutter/material.dart';

class CampusExceptionRouter extends StatelessWidget with ErrorHandlingView {
  CampusExceptionRouter({
    super.key,
    required this.campusException,
    required ErrorHandlingViewType errorHandlingViewType,
    Future<dynamic> Function(bool)? retry,
    Future<dynamic> Function(bool, BuildContext)? retryWithContext,
    Color? titleColor,
    Color? bodyColor,
  }) {
    this.errorHandlingViewType = errorHandlingViewType;
    this.retry = retry;
    this.retryWithContext = retryWithContext;
    this.titleColor = titleColor;
    this.bodyColor = bodyColor;
  }

  final CampusException campusException;

  @override
  Widget build(BuildContext context) {
    return exceptionMessage(context, campusException.message, null);
  }
}
