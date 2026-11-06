import 'dart:async';
import 'dart:convert';

import 'package:campus_flutter/base/enums/remote_config_message.dart';
import 'package:campus_flutter/base/services/remote_config_message_service.dart';
import 'package:campus_flutter/base/util/status_message.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FakeRemoteConfig config;
  late RemoteConfigMessageService service;
  late List<StatusMessage?> messages;

  setUp(() {
    config = FakeRemoteConfig();
    messages = [];
    service = RemoteConfigMessageService(config, messages.add);
  });

  tearDown(() async {
    await service.dispose();
    await config.updates.close();
  });

  test('custom translations take priority over both status flags', () async {
    config.values = {
      'isTUMOnlineMaintenanceMode': true,
      'isTUMOnlineDegraded': true,
      'tumOnlineStatusMessage_en': '  Maintenance until 18:00  ',
      'tumOnlineStatusMessage_de': '  Wartung bis 18:00  ',
    };
    await service.start();

    final message = messages.last! as LocalizedStatusMessage;
    expect(message.textForLanguage('en'), 'Maintenance until 18:00');
    expect(message.textForLanguage('de'), 'Wartung bis 18:00');
  });

  for (final language in ['en', 'de']) {
    test('uses the available translation when only $language is set', () async {
      config.values = {'tumOnlineStatusMessage_$language': 'Announcement'};
      await service.start();

      final message = messages.last! as LocalizedStatusMessage;
      expect(message.textForLanguage('en'), 'Announcement');
      expect(message.textForLanguage('de'), 'Announcement');
    });
  }

  test('empty translations fall back to the status flags', () async {
    config.values = {
      'tumOnlineStatusMessage_en': ' \n ',
      'tumOnlineStatusMessage_de': '',
      'isTUMOnlineMaintenanceMode': true,
    };
    await service.start();
    expect(messages.last, RemoteConfigMessage.tumOnlineMaintenance);
  });

  test('shows and removes custom messages through live updates', () async {
    await service.start();
    expect(messages.last, isNull);
    config.values['tumOnlineStatusMessage_en'] = 'New announcement';
    config.updates.add(RemoteConfigUpdate({'tumOnlineStatusMessage_en'}));
    await Future<void>.delayed(Duration.zero);
    expect(
      (messages.last! as LocalizedStatusMessage).textForLanguage('en'),
      'New announcement',
    );

    config.values.clear();
    config.updates.add(RemoteConfigUpdate({'tumOnlineStatusMessage_en'}));
    await Future<void>.delayed(Duration.zero);
    expect(messages.last, isNull);
  });

  test('removing custom text restores an unchanged status flag', () async {
    config.values = {
      'tumOnlineStatusMessage_en': 'Announcement',
      'isTUMOnlineDegraded': true,
    };
    await service.start();
    config.values.remove('tumOnlineStatusMessage_en');
    config.updates.add(RemoteConfigUpdate({'tumOnlineStatusMessage_en'}));
    await Future<void>.delayed(Duration.zero);
    expect(messages.last, RemoteConfigMessage.tumOnlineDegraded);
  });

  test('restores cached messages when fetch activates nothing new', () async {
    config.values = {'isTUMOnlineMaintenanceMode': true};
    await service.start();

    expect(messages.last, RemoteConfigMessage.tumOnlineMaintenance);
    expect(config.initialized, isTrue);
  });

  test(
    'shows cached messages before fetching and keeps them offline',
    () async {
      config.values = {'isTUMOnlineDegraded': true};
      config.fetchResult = Completer<bool>();
      final started = service.start();
      await Future<void>.delayed(Duration.zero);

      expect(messages, [RemoteConfigMessage.tumOnlineDegraded]);
      config.fetchResult!.completeError(Exception('offline'));
      await started;
      expect(messages.last, RemoteConfigMessage.tumOnlineDegraded);
    },
  );

  test('reads fetched values even if fetch returns false', () async {
    config.fetchResult = Completer<bool>();
    final started = service.start();
    await Future<void>.delayed(Duration.zero);
    config.values = {'isTUMOnlineDegraded': true};
    config.fetchResult!.complete(false);
    await started;

    expect(messages.last, RemoteConfigMessage.tumOnlineDegraded);
  });

  test('unrelated live updates preserve an active message', () async {
    config.values = {'isTUMOnlineMaintenanceMode': true};
    await service.start();
    config.values['unrelatedFlag'] = true;
    config.updates.add(RemoteConfigUpdate({'unrelatedFlag'}));
    await Future<void>.delayed(Duration.zero);

    expect(messages.last, RemoteConfigMessage.tumOnlineMaintenance);
  });

  test('disabling maintenance falls back to unchanged degraded flag', () async {
    config.values = {
      'isTUMOnlineDegraded': true,
      'isTUMOnlineMaintenanceMode': true,
    };
    await service.start();
    expect(messages.last, RemoteConfigMessage.tumOnlineMaintenance);

    config.values['isTUMOnlineMaintenanceMode'] = false;
    config.updates.add(RemoteConfigUpdate({'isTUMOnlineMaintenanceMode'}));
    await Future<void>.delayed(Duration.zero);

    expect(messages.last, RemoteConfigMessage.tumOnlineDegraded);
  });

  test('clears message when all known flags are disabled or removed', () async {
    config.values = {'isTUMOnlineDegraded': true, 'unrelatedFlag': true};
    await service.start();
    config.values.remove('isTUMOnlineDegraded');
    config.updates.add(RemoteConfigUpdate({'isTUMOnlineDegraded'}));
    await Future<void>.delayed(Duration.zero);

    expect(messages.last, isNull);
  });

  test('does not publish a pending fetch after disposal', () async {
    config.fetchResult = Completer<bool>();
    final started = service.start();
    await Future<void>.delayed(Duration.zero);
    await service.dispose();
    messages.clear();
    config.values = {'isTUMOnlineDegraded': true};
    config.fetchResult!.complete(true);
    await started;

    expect(messages, isEmpty);
    expect(config.updates.hasListener, isFalse);
  });
}

class FakeRemoteConfig implements FirebaseRemoteConfig {
  final updates = StreamController<RemoteConfigUpdate>();
  Map<String, Object> values = {};
  Completer<bool>? fetchResult;
  bool initialized = false;

  @override
  Future<void> ensureInitialized() async {
    initialized = true;
  }

  @override
  Future<bool> fetchAndActivate() async =>
      fetchResult == null ? false : await fetchResult!.future;

  @override
  Future<bool> activate() async => true;

  @override
  Stream<RemoteConfigUpdate> get onConfigUpdated => updates.stream;

  @override
  Map<String, RemoteConfigValue> getAll() {
    expect(initialized, isTrue);
    return values.map((key, value) => MapEntry(key, FakeConfigValue(value)));
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class FakeConfigValue extends RemoteConfigValue {
  FakeConfigValue(Object value)
    : super(utf8.encode('$value'), ValueSource.valueRemote);
}
