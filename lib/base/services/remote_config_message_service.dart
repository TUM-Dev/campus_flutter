import 'dart:async';

import 'package:campus_flutter/base/enums/remote_config_message.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class RemoteConfigMessageService {
  RemoteConfigMessageService(this._remoteConfig, this._onMessage);

  final FirebaseRemoteConfig _remoteConfig;
  final void Function(RemoteConfigMessage?) _onMessage;
  StreamSubscription<RemoteConfigUpdate>? _subscription;
  bool _disposed = false;

  Future<void> start() async {
    try {
      await _remoteConfig.ensureInitialized();
      _publishMessage();
      if (_disposed) return;

      _subscription = _remoteConfig.onConfigUpdated.listen(
        (_) => unawaited(_activateUpdate()),
        onError: (Object error) {
          debugPrint('Could not receive remote config updates: $error');
        },
      );
      // False means the values were already activated, not that they are empty.
      await _remoteConfig.fetchAndActivate();
      _publishMessage();
    } catch (error) {
      debugPrint('Could not load remote config messages: $error');
    }
  }

  Future<void> _activateUpdate() async {
    try {
      await _remoteConfig.activate();
      _publishMessage();
    } catch (error) {
      debugPrint('Could not activate remote config messages: $error');
    }
  }

  void _publishMessage() {
    if (_disposed) return;
    final values = _remoteConfig.getAll();
    RemoteConfigMessage? message;
    // Evaluate all known flags, since an update only reports changed keys.
    // Maintenance takes precedence over degraded service when both are enabled.
    for (final candidate in RemoteConfigMessage.values) {
      if (values[candidate.firebaseId]?.asBool() ?? false) {
        message = candidate;
      }
    }
    _onMessage(message);
  }

  Future<void> dispose() async {
    _disposed = true;
    await _subscription?.cancel();
  }
}
