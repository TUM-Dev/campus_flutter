import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_view.dart';
import 'package:campus_flutter/searchComponent/model/search_exception.dart';
import 'package:flutter/material.dart';

class SearchExceptionRouter extends StatelessWidget with ErrorHandlingView {
  SearchExceptionRouter({
    super.key,
    required this.searchException,
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

  final SearchException searchException;

  @override
  Widget build(BuildContext context) {
    return exceptionMessage(
      errorMessage: searchException.message,
      context: context,
    );
  }
}
