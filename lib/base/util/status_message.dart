import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

abstract interface class StatusMessage {
  String message(BuildContext context);
}

class LocalizedStatusMessage implements StatusMessage {
  const LocalizedStatusMessage({required this.english, required this.german});

  final String english;
  final String german;

  @override
  String message(BuildContext context) =>
      textForLanguage(context.locale.languageCode);

  String textForLanguage(String languageCode) {
    if (languageCode == 'de' && german.isNotEmpty) return german;
    return english.isNotEmpty ? english : german;
  }
}
