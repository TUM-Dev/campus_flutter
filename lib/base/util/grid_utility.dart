import 'package:campus_flutter/base/enums/device.dart';
import 'package:campus_flutter/base/services/device_type_service.dart';
import 'package:flutter/material.dart';

class GridUtility {
  static int campusCrossAxisCount(BuildContext context) {
    switch (DeviceService.getType(context)) {
      case Device.landscapeTablet:
        return 6;
      case Device.portraitTablet:
        return 4;
      case Device.phone:
        return 2;
    }
  }

  static int campusPaddedCrossAxisCount(BuildContext context) {
    switch (DeviceService.getType(context)) {
      case Device.landscapeTablet:
        return 3;
      case Device.portraitTablet:
        return 4;
      case Device.phone:
        return 2;
    }
  }

  static int campusNumberOfItems(BuildContext context) {
    switch (DeviceService.getType(context)) {
      case Device.landscapeTablet:
        return 6;
      case Device.portraitTablet:
        return 8;
      case Device.phone:
        return 6;
    }
  }
}
