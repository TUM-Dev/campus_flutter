import 'package:campus_flutter/base/enums/shortcut_item.dart';
import 'package:collection/collection.dart';

class EnumParser {
  static ShortcutItemType typeFromString(String string) {
    return ShortcutItemType.values.firstWhereOrNull((e) => e.type == string) ??
        ShortcutItemType.home;
  }
}
