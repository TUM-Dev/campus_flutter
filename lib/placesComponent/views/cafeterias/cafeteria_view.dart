import 'package:campus_flutter/base/classes/location.dart' as location;
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/directions_launcher.dart';
import 'package:campus_flutter/base/helpers/info_row.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/opening_hours.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/dish_grid_view.dart';
import 'package:campus_flutter/placesComponent/views/directions_button.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CafeteriaScaffold extends ConsumerWidget {
  const CafeteriaScaffold({super.key, required this.cafeteria});

  final Cafeteria cafeteria;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
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
            onPressed: () => launchDirections(
              location.Location(
                latitude: cafeteria.location.latitude,
                longitude: cafeteria.location.longitude,
              ),
              cafeteria.name,
              ref,
            ),
            icon: Icon(
              Icons.directions,
              color: context.theme.primaryColor,
            ),
          ),
        ],
      ),
      body: CafeteriaView(
        cafeteria: cafeteria,
      ),
    );
  }

  void _alertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final openingHours = cafeteria.openingHours;
        return AlertDialog(
          title: Text(
            context.localizations.openingHours,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InfoRow(
                title: context.localizations.monday,
                info: _openingHourStringBuilder(openingHours?.mon, context),
              ),
              InfoRow(
                title: context.localizations.tuesday,
                info: _openingHourStringBuilder(openingHours?.tue, context),
              ),
              InfoRow(
                title: context.localizations.wednesday,
                info: _openingHourStringBuilder(openingHours?.wed, context),
              ),
              InfoRow(
                title: context.localizations.thursday,
                info: _openingHourStringBuilder(openingHours?.thu, context),
              ),
              InfoRow(
                title: context.localizations.friday,
                info: _openingHourStringBuilder(openingHours?.fri, context),
              ),
              InfoRow(
                title: context.localizations.weekend,
                info: context.localizations.closed,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
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
      return context.localizations.unknown;
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
  late (bool, OpeningHour?) openingHours;

  @override
  void initState() {
    final today = DateTime.now();
    selectedDate = DateTime(today.year, today.month, today.day);
    openingHours = widget.cafeteria.openingHoursForDate(today);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return Row(
            children: [
              Expanded(
                child: Column(
                  children: [..._mapAndDirections()],
                ),
              ),
              Expanded(child: _pickerAndSlider(true)),
            ],
          );
        } else {
          return Column(
            children: [
              if (openingHours.$2 != null && openingHours.$1)
                _openingTimes(openingHours, context),
              //..._mapAndDirections(),
              //const PaddedDivider(),*/
              _pickerAndSlider(false),
            ],
          );
        }
      },
    );
  }

  // TODO: optimize flow
  Widget _openingTimes(
    (bool, OpeningHour?) openingHours,
    BuildContext context,
  ) {
    if (!openingHours.$1) {
      return Text(context.localizations.closedToday);
    } else {
      return Text(
        context.localizations.open(
          widget.cafeteria.getDayString(DateTime.now(), context),
          openingHours.$2!.start,
          openingHours.$2!.end,
        ),
      );
    }
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
      DirectionsButton.latLng(
        name: widget.cafeteria.name,
        latitude: widget.cafeteria.location.latitude,
        longitude: widget.cafeteria.location.longitude,
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
                context.localizations.noEntriesFound(
                  context.localizations.mealPlan,
                ),
              ),
            );
          } else {
            final menu = snapshot.data!;
            final todayMeals = ref.read(cafeteriasViewModel).getTodayDishes(
                  menu.firstWhereOrNull(
                    (element) =>
                        element.date.isAtSameMomentAs(selectedDate) ||
                        element.date.isAfter(selectedDate),
                  ),
                );
            return Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(context.padding),
                    child: SizedBox(
                      height: 80,
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
                        context.localizations.noEntriesFound(
                          context.localizations.mealPlan,
                        ),
                      ),
                    ),
                ],
              ),
            );
          }
        } else if (snapshot.hasError) {
          return ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.descriptionOnly,
          );
        } else {
          return const DelayedLoadingIndicator();
        }
      },
    );
  }
}
