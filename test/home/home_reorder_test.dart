import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/enums/widget_type.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:campus_flutter/homeComponent/viewmodel/home_viewmodel.dart';
import 'package:campus_flutter/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer container;
  late SharedPreferences preferences;
  late HomeViewModel model;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    preferences = await SharedPreferences.getInstance();
    getIt.registerSingleton(UserPreferencesService(preferences));
    container = ProviderContainer();
    model = container.read(homeViewModel);
  });

  tearDown(() async {
    await model.widgets.close();
    container.dispose();
    await getIt.reset();
  });

  test('moves an item down using the adjusted onReorderItem index', () {
    model.reorder(0, 1);

    expect(model.widgets.value.map((widget) => widget.widgetType), [
      WidgetType.calendar,
      WidgetType.cafeterias,
      WidgetType.departures,
      WidgetType.studyRooms,
    ]);
    expect(
      preferences.getStringList(UserPreference.homeWidgets.name),
      model.widgets.value.map((widget) => widget.convertToString()).toList(),
    );
  });

  test('moves an item to the end and back to the beginning', () {
    model.reorder(0, 3);
    expect(model.widgets.value.last.widgetType, WidgetType.cafeterias);

    model.reorder(3, 0);
    expect(
      model.widgets.value.map((widget) => widget.widgetType),
      HomeViewModel.defaultWidgets.map((widget) => widget.widgetType),
    );
  });
}
