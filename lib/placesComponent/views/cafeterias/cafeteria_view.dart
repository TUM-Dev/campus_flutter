import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/views/directions_button.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/cafeteria_widget_view.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
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
      ),
      body: CafeteriaView(
        cafeteria: cafeteria,
      ),
    );
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
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return Row(
          children: [
            Expanded(
              child: Column(
                children: [..._mapAndDirections()],
              ),
            ),
            Expanded(child: _pickerAndSlider())
          ],
        );
      } else {
        return Column(
          children: [
            ..._mapAndDirections(),
            const PaddedDivider(),
            _pickerAndSlider()
          ],
        );
      }
    });
  }

  List<Widget> _mapAndDirections() {
    return [
      MapWidget.fullPadding(
        markers: {
          Marker(
              markerId: MarkerId(widget.cafeteria.id),
              position: LatLng(widget.cafeteria.location.latitude,
                  (widget.cafeteria.location.longitude)),
              icon: BitmapDescriptor.defaultMarkerWithHue(208)),
        },
        latLng: LatLng(widget.cafeteria.location.latitude,
            widget.cafeteria.location.longitude),
        zoom: 15,
        aspectRatio: 2,
      ),
      DirectionsButton.latLng(
          name: widget.cafeteria.name,
          latitude: widget.cafeteria.location.latitude,
          longitude: widget.cafeteria.location.longitude),
    ];
  }

  Widget _pickerAndSlider() {
    return FutureBuilder(
        future: ref
            .read(cafeteriasViewModel)
            .fetchCafeteriaMenu(false, widget.cafeteria),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final menu = snapshot.data!;
            final todayMeals = ref.read(cafeteriasViewModel).getTodayDishes(
                menu.firstWhereOrNull(
                    (element) => element.date.isAtSameMomentAs(selectedDate)));
            return Column(
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
                                  numberOfWeeksInView: 1, firstDayOfWeek: 1),
                          onSelectionChanged: (args) => setState(() {
                            selectedDate = args.value as DateTime;
                          }),
                          selectableDayPredicate: (date) {
                            return date.weekday != DateTime.saturday &&
                                date.weekday != DateTime.sunday;
                          },
                        ))),
                if (todayMeals.isNotEmpty)
                  DishSlider(
                    dishes: todayMeals,
                    //inverted: true,
                  ),
                if (todayMeals.isEmpty)
                  const Center(
                    child: Text("no meal plan found"),
                  )
              ],
            );
          } else if (snapshot.hasError) {
            return ErrorHandlingView(
                error: snapshot.error!,
                errorHandlingViewType: ErrorHandlingViewType.descriptionOnly);
          } else {
            return const DelayedLoadingIndicator();
          }
        });
  }
}
