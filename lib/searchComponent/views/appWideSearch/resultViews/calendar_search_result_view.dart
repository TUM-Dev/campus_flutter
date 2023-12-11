import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_details_view.dart';
import 'package:campus_flutter/base/enums/search_category.dart';
import 'package:campus_flutter/searchComponent/viewmodels/searchableViewModels/calendar_search_viewmodel.dart';
import 'package:campus_flutter/searchComponent/views/appWideSearch/search_result_card_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarSearchResultView extends ConsumerWidget {
  const CalendarSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchResultCardView<CalendarSearchViewModel, CalendarEvent>(
      searchCategory: SearchCategory.calendar,
      viewModel: calendarSearchViewModel,
      body: (calendarEvent) => ListTile(
        title: Text(calendarEvent.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconText(
              iconData: Icons.hourglass_top,
              label: calendarEvent.timeDatePeriod(context),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              iconColor: Theme.of(context).primaryColor,
            ),
            IconText(
              iconData: Icons.location_pin,
              label: calendarEvent.location ?? context.localizations.unknown,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              iconColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  leading: const BackButton(),
                ),
                body: SafeArea(
                  child: LectureDetailsView(
                    event: calendarEvent,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
