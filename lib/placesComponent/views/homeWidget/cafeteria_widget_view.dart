import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/horizontal_slider.dart';
import 'package:campus_flutter/base/helpers/tapable.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria_menu.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/dish.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/cafeteria_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CafeteriaWidgetView extends ConsumerStatefulWidget {
  const CafeteriaWidgetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CafeteriaWidgetViewState();
}

class _CafeteriaWidgetViewState extends ConsumerState<CafeteriaWidgetView> {
  @override
  void initState() {
    ref.read(cafeteriasViewModel).fetchClosestCafeteria(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(cafeteriasViewModel).closestCafeteria,
        builder: (context, snapshot) {
          return WidgetFrameView(
              titleWidget: Row(
                children: [
                  Expanded(
                    child: Tapable(
                      child: Text(
                          snapshot.data?.$1.name ??
                              context.localizations.cafeteria,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      action: () => snapshot.data != null
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CafeteriaScaffold(
                                      cafeteria: snapshot.data!.$1)))
                          : null,
                    ),
                  ),
                  if (ref.read(cafeteriasViewModel).closestCafeterias.length >
                      1)
                    PopupMenuButton<String>(
                      itemBuilder: (context) =>
                          ref.read(cafeteriasViewModel).getMenuEntries(),
                      onSelected: (selected) {
                        ref
                            .read(cafeteriasViewModel)
                            .setClosestCafeteria(selected);
                      },
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                ],
              ),
              subtitle: _openingHours(),
              child: _dynamicContent(snapshot));
        });
  }

  Widget? _openingHours() {
    final openingHours = ref
        .read(cafeteriasViewModel)
        .closestCafeteria
        .value
        ?.$1
        .openingHoursToday;
    if (openingHours?.$2 != null) {
      return Padding(
          padding: EdgeInsets.only(left: context.padding),
          child: Text(context.localizations
              .openToday(openingHours!.$2!.start, openingHours.$2!.end)));
    } else {
      return null;
    }
  }

  Widget _dynamicContent(AsyncSnapshot<(Cafeteria, CafeteriaMenu)?> snapshot) {
    if (snapshot.hasData) {
      final dishes =
          ref.watch(cafeteriasViewModel).getTodayDishes(snapshot.data!.$2);
      if (dishes.isNotEmpty) {
        return DishSlider(dishes: dishes);
      } else {
        return Card(
            child: SizedBox(
                height: 150,
                child: Center(
                    child: Text(context.localizations.noMealPlanFound))));
      }
    } else if (snapshot.hasError) {
      return Card(
          child: SizedBox(
              height: 150,
              child: ErrorHandlingView(
                  error: snapshot.error!,
                  errorHandlingViewType: ErrorHandlingViewType.descriptionOnly,
                  retry: ref.read(cafeteriasViewModel).fetchClosestCafeteria)));
    } else {
      return const Card(
          child: SizedBox(
              height: 150, child: DelayedLoadingIndicator(name: "Mealplan")));
    }
  }
}

class DishSlider extends StatelessWidget {
  const DishSlider({super.key, required this.dishes, this.inverted = false});

  final List<(Dish, String)> dishes;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return HorizontalSlider<(Dish, String)>.height(
        data: dishes,
        height: 160,
        leadingTrailingPadding: !inverted,
        child: (dish) {
          return DishCard(
            dish: dish,
            inverted: inverted,
          );
        });
  }
}

class DishCard extends StatelessWidget {
  const DishCard({super.key, required this.dish, required this.inverted});

  final (Dish, String) dish;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return CardWithPadding(
        color: inverted ? Theme.of(context).colorScheme.background : null,
        height: 150,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(dish.$2,
                        style: Theme.of(context).textTheme.titleLarge),
                    const Spacer(),
                    IconButton(
                      onPressed: () => _dishInfoAlert(dish.$1, context),
                      icon: Icon(Icons.info_outline,
                          color: Theme.of(context).primaryColor),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerRight,
                      highlightColor: Colors.transparent,
                    )
                  ],
                )),
                const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Expanded(
                    flex: 3,
                    child: Text(
                      dish.$1.name,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )),
                Expanded(
                    child: Text(
                  CafeteriasViewModel.formatPrice(dish.$1),
                  maxLines: 1,
                ))
              ],
            )));
  }

  _dishInfoAlert(Dish dish, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(dish.name),
            actionsAlignment: MainAxisAlignment.center,
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              for (var label in dish.labels) ...[Text(label)],
              Text(CafeteriasViewModel.formatPrice(dish))
            ]),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Okay"))
            ],
          );
        });
  }
}
