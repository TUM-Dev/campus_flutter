import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewModels/search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/viewModels/searchableViewModels/calendar_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/search_result_card_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CalendarSearchResultView extends ConsumerWidget {
  const CalendarSearchResultView({super.key, required this.viewModel});

  final Provider<SearchViewModel> viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<CalendarSearchViewModel, CalendarEvent>(
      searchCategory: SearchCategory.calendar,
      viewModel: viewModel,
      categoryViewModel: calendarSearchViewModel,
      body: (calendarEvent) => ListTile(
        title: Text(calendarEvent.title ?? "-"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconText(
              iconData: Icons.hourglass_top,
              label: calendarEvent.timePeriodText(context),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              iconColor: context.primaryColor,
            ),
            IconText(
              iconData: Icons.location_pin,
              label: calendarEvent.location ?? context.tr("unknown"),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              iconColor: context.primaryColor,
            ),
          ],
        ),
        onTap: () => context.push(calendarDetails, extra: calendarEvent),
      ),
    );
  }
}
