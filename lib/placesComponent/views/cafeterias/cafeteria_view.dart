import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/map_launcher.dart';
import 'package:campus_flutter/base/util/info_row.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/util/places_util.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/opening_hours.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/dish_grid_view.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CafeteriaScaffold extends ConsumerWidget {
  const CafeteriaScaffold({super.key, required this.cafeteria});

  final Cafeteria cafeteria;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(cafeteria.name),
        centerTitle: true,
        actions: [
          if (cafeteria.openingHours != null)
            IconButton(
              onPressed: () => _alertDialog(context),
              icon: Icon(
                Icons.access_time_filled,
                color: context.theme.primaryColor,
              ),
            ),
          IconButton(
            onPressed: () => showDirectionsDialog(
              cafeteria.name,
              LatLng(cafeteria.location.latitude, cafeteria.location.longitude),
              context,
            ),
            icon: Icon(Icons.directions, color: context.theme.primaryColor),
          ),
        ],
      ),
      body: CafeteriaView(cafeteria: cafeteria),
    );
  }

  void _alertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final openingHours = cafeteria.openingHours;
        return AlertDialog(
          title: Text(
            context.tr("openingHours"),
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InfoRow(
                title: context.tr("monday"),
                info: _openingHourStringBuilder(openingHours?.mon, context),
              ),
              InfoRow(
                title: context.tr("tuesday"),
                info: _openingHourStringBuilder(openingHours?.tue, context),
              ),
              InfoRow(
                title: context.tr("wednesday"),
                info: _openingHourStringBuilder(openingHours?.wed, context),
              ),
              InfoRow(
                title: context.tr("thursday"),
                info: _openingHourStringBuilder(openingHours?.thu, context),
              ),
              InfoRow(
                title: context.tr("friday"),
                info: _openingHourStringBuilder(openingHours?.fri, context),
              ),
              InfoRow(title: context.tr("weekend"), info: context.tr("closed")),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text("Okay"),
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }

  String _openingHourStringBuilder(
    OpeningHour? openingHour,
    BuildContext context,
  ) {
    if (openingHour == null) {
      return context.tr("unknown");
    } else {
      return "${openingHour.start} - ${openingHour.end}";
    }
  }
}

class CafeteriaView extends ConsumerStatefulWidget {
  const CafeteriaView({super.key, required this.cafeteria});

  final Cafeteria cafeteria;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CafeteriaViewState();
}

class _CafeteriaViewState extends ConsumerState<CafeteriaView> {
  late DateTime selectedDate;

  @override
  void initState() {
    final today = DateTime.now();
    selectedDate = DateTime(today.year, today.month, today.day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return Row(
            children: [
              Expanded(child: Column(children: [..._mapAndDirections()])),
              Expanded(child: _pickerAndSlider(true)),
            ],
          );
        } else {
          return _pickerAndSlider(false);
        }
      },
    );
  }

  List<Widget> _mapAndDirections() {
    return [
      MapWidget.fullPadding(
        markers: {
          Marker(
            markerId: MarkerId(widget.cafeteria.id),
            position: LatLng(
              widget.cafeteria.location.latitude,
              (widget.cafeteria.location.longitude),
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(208),
          ),
        },
        latLng: LatLng(
          widget.cafeteria.location.latitude,
          widget.cafeteria.location.longitude,
        ),
        zoom: 15,
        aspectRatio: 2,
      ),
    ];
  }

  Widget _pickerAndSlider(bool isLandscape) {
    return FutureBuilder(
      future: ref
          .read(cafeteriasViewModel)
          .fetchCafeteriaMenu(false, widget.cafeteria),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                context.tr("noEntriesFound", args: [context.tr("mealPlans")]),
              ),
            );
          } else {
            final menu = snapshot.data!;
            final todayMeals = ref
                .read(cafeteriasViewModel)
                .getTodayDishes(
                  menu.firstWhereOrNull(
                    (element) =>
                        element.date.isAtSameMomentAs(selectedDate) ||
                        element.date.isAfter(selectedDate),
                  ),
                );
            final Widget? openingHoursWidget = PlacesUtil.openingHours(
              widget.cafeteria.openingHoursForDate(selectedDate),
              selectedDate,
              context,
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (openingHoursWidget != null) openingHoursWidget,
                Padding(
                  padding: EdgeInsets.all(context.padding),
                  child: SizedBox(
                    height: 80,
                    child: SfDateRangePickerTheme(
                      data: const SfDateRangePickerThemeData(
                        headerBackgroundColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                      ),
                      child: SfDateRangePicker(
                        headerHeight: 0,
                        toggleDaySelection: false,
                        enablePastDates: false,
                        allowViewNavigation: false,
                        initialSelectedDate: menu.first.date,
                        minDate: menu.first.date,
                        maxDate: menu.last.date,
                        monthViewSettings:
                            const DateRangePickerMonthViewSettings(
                              numberOfWeeksInView: 1,
                              firstDayOfWeek: 1,
                            ),
                        onSelectionChanged: (args) => setState(() {
                          selectedDate = args.value as DateTime;
                        }),
                        selectableDayPredicate: (date) {
                          return date.weekday != DateTime.saturday &&
                              date.weekday != DateTime.sunday;
                        },
                      ),
                    ),
                  ),
                ),
                if (todayMeals.isNotEmpty)
                  Expanded(
                    child: DishGridView(
                      dishes: todayMeals,
                      isLandscape: isLandscape,
                      //inverted: true,
                    ),
                  ),
                if (todayMeals.isEmpty)
                  Center(
                    child: Text(
                      context.tr(
                        "noEntriesFound",
                        args: [context.tr("mealPlans")],
                      ),
                    ),
                  ),
              ],
            );
          }
        } else if (snapshot.hasError) {
          return ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.descriptionOnly,
          );
        } else {
          return DelayedLoadingIndicator(name: context.tr("mealPlans"));
        }
      },
    );
  }
}
