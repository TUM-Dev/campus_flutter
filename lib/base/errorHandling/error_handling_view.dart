import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

mixin ErrorHandlingView {
  late final ErrorHandlingViewType errorHandlingViewType;
  late final Function()? retry;
  late final Color? titleColor;
  late final Color? bodyColor;

  Widget exceptionMessage({
    required String errorMessage,
    String? fixMessage,
    Function()? retry,
    String? retryMessage,
    bool allowRetry = true,
    required BuildContext context,
  }) {
    switch (errorHandlingViewType) {
      case ErrorHandlingViewType.fullScreen:
      case ErrorHandlingViewType.fullScreenNoImage:
        return LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.hasBoundedHeight
                    ? constraints.maxHeight
                    : 0,
              ),
              child: Padding(
                padding: EdgeInsets.all(context.padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (errorHandlingViewType ==
                        ErrorHandlingViewType.fullScreen)
                      Padding(
                        padding: EdgeInsets.only(bottom: context.padding * 2),
                        child: SvgPicture.asset(
                          "assets/images/errors/error.svg",
                          height: MediaQuery.sizeOf(context).height * 0.25,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    _errorMessageText(
                      errorMessage,
                      context,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(color: titleColor ?? context.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    if (fixMessage != null)
                      Padding(
                        padding: EdgeInsets.only(top: context.padding),
                        child: Text(
                          fixMessage,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: bodyColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (allowRetry && (retry != null || this.retry != null))
                      Padding(
                        padding: EdgeInsets.only(top: context.padding),
                        child: ElevatedButton(
                          onPressed: () =>
                              retry != null ? retry() : this.retry!(),
                          child: Text(retryMessage ?? context.tr("tryAgain")),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      case ErrorHandlingViewType.snackBar:
        return Text([errorMessage, ?fixMessage].join('\n'));
      case ErrorHandlingViewType.textOnly:
        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _errorMessageText(
                  errorMessage,
                  context,
                  style: Theme.of(context).textTheme.bodyLarge
                      ?.copyWith(color: titleColor ?? context.primaryColor),
                  textAlign: TextAlign.center,
                ),
                if (fixMessage != null)
                  Text(
                    fixMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: bodyColor),
                  ),
                if (allowRetry && (retry != null || this.retry != null))
                  TextButton(
                    onPressed: () => retry != null ? retry() : this.retry!(),
                    child: Text(retryMessage ?? context.tr("tryAgain")),
                  ),
              ],
            ),
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
