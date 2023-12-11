import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';

mixin ErrorHandlingView {
  late final ErrorHandlingViewType errorHandlingViewType;
  late final Future<dynamic> Function(bool)? retry;
  late final Color? titleColor;
  late final Color? bodyColor;

  Widget exceptionMessage(
    BuildContext context,
    String errorMessage,
    String? fixMessage,
  ) {
    switch (errorHandlingViewType) {
      case ErrorHandlingViewType.fullScreen:
      case ErrorHandlingViewType.fullScreenNoImage:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (errorHandlingViewType ==
                  ErrorHandlingViewType.fullScreen) ...[
                const Spacer(),
                Image.asset(
                  "assets/images/errors/error_square.png",
                  height: MediaQuery.of(context).size.height * 0.3333,
                  fit: BoxFit.scaleDown,
                ),
                const Spacer(),
              ],
              Expanded(
                flex: 0,
                child: Column(
                  children: [
                    _errorMessageText(
                      errorMessage,
                      context,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: titleColor ?? Theme.of(context).primaryColor,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (fixMessage != null)
                      Text(
                        fixMessage,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: bodyColor),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              const Spacer(),
              if (retry != null) ...[
                ElevatedButton(
                  onPressed: () => retry!(true),
                  child: Text(context.localizations.tryAgain),
                ),
                const Spacer(),
              ],
            ],
          ),
        );
      case ErrorHandlingViewType.textOnly:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _errorMessageText(
                errorMessage,
                context,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: titleColor ?? Theme.of(context).primaryColor,
                    ),
                textAlign: TextAlign.center,
              ),
              if (fixMessage != null)
                Text(
                  fixMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: bodyColor),
                ),
            ],
          ),
        );
      case ErrorHandlingViewType.descriptionOnly:
        return Center(
          child: _errorMessageText(
            errorMessage,
            context,
            style: TextStyle(color: bodyColor),
          ),
        );
      case ErrorHandlingViewType.redDescriptionOnly:
        return Center(
          child: _errorMessageText(
            errorMessage,
            context,
            style: const TextStyle(color: Colors.red),
          ),
        );
    }
  }

  Widget _errorMessageText(
    String errorMessage,
    BuildContext context, {
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return /*GestureDetector(
      onDoubleTap: () => showStackTrace(context),
      child: */
        Text(
      errorMessage,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      //),
    );
  }

  /*showStackTrace(BuildContext context) {
    if (error is Error) {
      showDialog(
        context: context,
        builder: (context) {
          final split = (error as Error).stackTrace.toString().split("\n");
          return AlertDialog(
            title: Text(
              "Error Description",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
              textAlign: TextAlign.center,
            ),
            content: Text(
              split.isNotEmpty
                  ? split.first
                  : (error as Error).stackTrace.toString(),
              textAlign: TextAlign.center,
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Okay"),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
    }
  }*/
}
