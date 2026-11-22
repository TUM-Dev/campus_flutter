import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final defaultCampusProvider = NotifierProvider<DefaultCampusNotifier, Campus?>(
  DefaultCampusNotifier.new,
);

/// Holds the user's default campus. `null` means "Automatic".
class DefaultCampusNotifier extends Notifier<Campus?> {
  /// Stored when the user explicitly picks "Automatic", so we can tell an
  /// explicit choice apart from never having been asked.
  static const _automatic = 'automatic';

  /// Whether the user has already made a choice (including "Automatic").
  static bool get hasChosen {
    if (!getIt.isRegistered<UserPreferencesService>()) return true;
    return getIt<UserPreferencesService>().load(UserPreference.defaultCampus) !=
        null;
  }

  @override
  Campus? build() {
    if (!getIt.isRegistered<UserPreferencesService>()) return null;
    final saved = getIt<UserPreferencesService>().load(
      UserPreference.defaultCampus,
    );
    return Campus.values.asNameMap()[saved];
  }

  void select(Campus? campus) {
    final name = campus == null ? _automatic : EnumName(campus).name;
    getIt<UserPreferencesService>().save(UserPreference.defaultCampus, name);
    state = campus;
  }
}
