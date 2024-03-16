import 'package:campus_flutter/base/enums/widget_type.dart';

class HomeScreenWidget {
  WidgetType widgetType;
  bool enabled;

  HomeScreenWidget({
    required this.widgetType,
    this.enabled = true,
  });

  String convertToString() {
    return "${WidgetType.values.indexOf(widgetType)};${enabled.toString()}";
  }

  factory HomeScreenWidget.fromString(String data) {
    final dataPoints = data.split(";");
    final widgetType = WidgetType.values[int.parse(dataPoints[0])];
    final enabled = dataPoints[1] == "true" ? true : false;
    return HomeScreenWidget(widgetType: widgetType, enabled: enabled);
  }
}
