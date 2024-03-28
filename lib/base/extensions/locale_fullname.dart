import 'dart:ui';

extension FullName on Locale {
  String fullName() {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'de':
        return 'Deutsch';
    }
    return 'Unknown';
  }
}
