import 'package:campus_flutter/base/enums/device.dart';
import 'package:flutter/cupertino.dart';

class DeviceService {
  static Device getType(BuildContext context) {
    return MediaQuery.orientationOf(context) == Orientation.landscape
        ? Device.landscapeTablet
        : MediaQuery.sizeOf(context).width > 600
        ? Device.portraitTablet
        : Device.phone;
  }
}
