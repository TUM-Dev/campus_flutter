import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria_menu.dart';
import 'package:campus_flutter/placesComponent/views/homeWidget/cafeteria_widget_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CafeteriaCardView extends StatelessWidget {
  const CafeteriaCardView({super.key, required this.cafeteria});

  final Cafeteria cafeteria;

  @override
  Widget build(BuildContext context) {
    return CardWithPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: CafeteriaRowView(
          cafeteria: cafeteria,
        ));
  }
}

class CafeteriaRowView extends ConsumerStatefulWidget {
  const CafeteriaRowView({super.key, required this.cafeteria});

  final Cafeteria cafeteria;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CafeteriaRowViewState();
}

class _CafeteriaRowViewState extends ConsumerState<CafeteriaRowView> {
  Future future = Future(() {});
  late DateTime selectedDate;

  _CafeteriaRowViewState() {
    final today = DateTime.now();
    selectedDate = DateTime(today.year, today.month, today.day);
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      textColor: color,
      iconColor: color,
      collapsedTextColor: color,
      collapsedIconColor: color,
      title: Text(
        widget.cafeteria.name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      onExpansionChanged: (isExpanded) {
        if (isExpanded) {
          setState(() {
            future = ref
                .read(cafeteriasViewModel)
                .fetchCafeteriaMenu(false, widget.cafeteria);
          });
        }
      },
      children: [
        FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final menu = snapshot.data! as List<CafeteriaMenu>;
                final todayMeals = ref.read(cafeteriasViewModel).getTodayDishes(
                    menu.firstWhereOrNull((element) =>
                        element.date.isAtSameMomentAs(selectedDate)));
                return Column(
                  children: [
                    SizedBox(
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
                        )),
                    if (todayMeals.isNotEmpty)
                      DishSlider(
                        dishes: todayMeals,
                        inverted: true,
                      )
                    //Text(dishes.first.$1.name)
                  ],
                );
              } else if (snapshot.hasError) {
                return ErrorHandlingView(
                    error: snapshot.error!,
                    errorHandlingViewType:
                        ErrorHandlingViewType.descriptionOnly);
              } else {
                return const DelayedLoadingIndicator();
              }
            })
      ],
    );
  }
}
