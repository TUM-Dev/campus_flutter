import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/preference_selection_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria_menu.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/dish_slider_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CafeteriaWidgetView extends ConsumerStatefulWidget {
  const CafeteriaWidgetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CafeteriaWidgetViewState();
}

class _CafeteriaWidgetViewState extends ConsumerState<CafeteriaWidgetView> {
  @override
  void initState() {
    ref.read(cafeteriasViewModel).fetchWidgetCafeteria(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.watch(cafeteriasViewModel).widgetCafeteria,
      builder: (context, snapshot) {
        return WidgetFrameView(
          titleWidget: Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Text(
                    snapshot.data?.$1.name ?? context.localizations.cafeteria,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => snapshot.data != null
                      ? context.push(cafeteriaWidget, extra: snapshot.data!.$1)
                      : null,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.filter_list,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () => showModalBottomSheet(
                  builder: (context) => PreferenceSelectionView<Cafeteria>(
                    data: ref
                        .read(cafeteriasViewModel)
                        .getCafeteriaEntries(context),
                    entry: context.localizations.cafeteria,
                  ),
                  context: context,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  useSafeArea: true,
                  showDragHandle: true,
                ),
              ),
            ],
          ),
          subtitle: _openingHours(snapshot.data),
          child: _dynamicContent(snapshot),
        );
      },
    );
  }

  Widget? _openingHours((Cafeteria, CafeteriaMenu?)? value) {
    if (value != null && value.$2 != null) {
      final openingHours = value.$1.openingHoursForDate(value.$2!.date);
      final dayString = value.$1.getDayString(value.$2!.date, context);
      return Padding(
        padding: EdgeInsets.only(left: context.padding),
        child: Text(
          context.localizations.open(
            dayString,
            openingHours.$2!.start,
            openingHours.$2!.end,
          ),
        ),
      );
    } else {
      return null;
    }
  }

  Widget _dynamicContent(AsyncSnapshot<(Cafeteria, CafeteriaMenu?)?> snapshot) {
    if (snapshot.hasData) {
      final dishes =
          ref.watch(cafeteriasViewModel).getTodayDishes(snapshot.data!.$2);
      if (dishes.isNotEmpty) {
        return DishSliderView(dishes: dishes);
      } else {
        return Card(
          child: SizedBox(
            height: 150,
            child: Center(
              child: Text(
                context.localizations.noEntriesFound(
                  context.localizations.mealPlans,
                ),
              ),
            ),
          ),
        );
      }
    } else if (snapshot.hasError) {
      return Card(
        child: SizedBox(
          height: 150,
          child: ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.descriptionOnly,
            retry: ref.read(cafeteriasViewModel).fetchWidgetCafeteria,
          ),
        ),
      );
    } else {
      return Card(
        child: SizedBox(
          height: 150,
          child: DelayedLoadingIndicator(name: context.localizations.mealPlans),
        ),
      );
    }
  }
}
