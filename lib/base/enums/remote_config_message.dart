import 'package:campus_flutter/base/util/status_message.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

enum RemoteConfigMessage implements StatusMessage {
  tumOnlineDegraded,
  tumOnlineMaintenance;

  String get firebaseId {
    switch (this) {
      case RemoteConfigMessage.tumOnlineDegraded:
        return "isTUMOnlineDegraded";
      case RemoteConfigMessage.tumOnlineMaintenance:
        return "isTUMOnlineMaintenanceMode";
    }
  }

  @override
  String message(BuildContext context) {
    switch (this) {
      case RemoteConfigMessage.tumOnlineDegraded:
        return context.tr("tumOnlineDegraded");
      case RemoteConfigMessage.tumOnlineMaintenance:
        return context.tr("tumOnlineMaintenance");
    }
  }

  static RemoteConfigMessage? fromString(String key) {
    if (key == "isTUMOnlineDegraded") {
      return RemoteConfigMessage.tumOnlineDegraded;
    } else if (key == "isTUMOnlineMaintenanceMode") {
      return RemoteConfigMessage.tumOnlineMaintenance;
    } else {
      return null;
    }
  }

  static Set<String> get keys {
    return RemoteConfigMessage.values.map((e) => e.firebaseId).toSet();
  }
}
