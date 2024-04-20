import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

mixin ErrorHandlingView {
  late final ErrorHandlingViewType errorHandlingViewType;
  late final Future<dynamic> Function(bool)? retry;
  late final Future<dynamic> Function(bool, BuildContext)? retryWithContext;
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
                SvgPicture.asset(
                  "assets/images/errors/error.svg",
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
                            color: titleColor ?? context.primaryColor,
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
              if (retry != null && retryWithContext == null) ...[
                ElevatedButton(
                  onPressed: retry != null ? () => retry?.call(true) : null,
                  child: Text(context.localizations.tryAgain),
                ),
                const Spacer(),
              ],
              if (retryWithContext != null && retry == null) ...[
                ElevatedButton(
                  onPressed: () => retryWithContext != null
                      ? () => retryWithContext?.call(true, context)
                      : null,
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
                      color: titleColor ?? context.primaryColor,
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
        return _errorMessageText(
          errorMessage,
          context,
          style: TextStyle(color: bodyColor),
          textAlign: TextAlign.center,
        );
      case ErrorHandlingViewType.redDescriptionOnly:
        return _errorMessageText(
          errorMessage,
          context,
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
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
    return Text(
      errorMessage,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
