import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_view.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:flutter/material.dart';

class TumOnlineApiExceptionRouter extends StatelessWidget
    with ErrorHandlingView {
  TumOnlineApiExceptionRouter({
    super.key,
    required this.tumOnlineApiException,
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

  final TumOnlineApiException tumOnlineApiException;

  @override
  Widget build(BuildContext context) {
    return exceptionMessage(
      context,
      tumOnlineApiException.message,
      tumOnlineApiException.recoverySuggestion,
    );
  }
}
