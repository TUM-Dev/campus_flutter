import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/campusComponent/model/campus_event.dart';
import 'package:campus_flutter/campusComponent/view/event/event_card_view.dart';
import 'package:campus_flutter/campusComponent/view/shared/campus_section_heading.dart';
import 'package:campus_flutter/campusComponent/viewmodel/events_viewmodel.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class EventsWidgetView extends ConsumerStatefulWidget {
  const EventsWidgetView({super.key});

  @override
  ConsumerState<EventsWidgetView> createState() => _EventsWidgetViewState();
}

class _EventsWidgetViewState extends ConsumerState<EventsWidgetView> {
  String? _languageCode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final languageCode = context.locale.languageCode;
    if (_languageCode == languageCode) return;
    _languageCode = languageCode;
    ref.read(eventsViewModel).fetch(false, languageCode: languageCode);
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<List<CampusEvent>?>(
    stream: ref.watch(eventsViewModel).events,
    builder: (context, snapshot) {
      if (snapshot.hasData && snapshot.data!.isEmpty) {
        return const SizedBox.shrink();
      }
      return WidgetFrameView(
        titleWidget: StreamBuilder<int>(
          stream: ref.watch(eventsViewModel).selectedCampus,
          builder: (context, _) => CampusSectionHeading(
            title: ref.read(eventsViewModel).campusName,
            onMore: () => context.push(events),
          ),
        ),
        child: _body(snapshot),
      );
    },
  );

  Widget _body(AsyncSnapshot<List<CampusEvent>?> snapshot) {
    if (snapshot.hasData) {
      final cols = MediaQuery.of(context).size.width >= 600 ? 2 : 1;
      final items = snapshot.data!.take(cols * 3).toList();
      final textScale = MediaQuery.textScalerOf(context).scale(14) / 14;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: context.padding),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 100 * textScale,
          ),
          itemBuilder: (context, index) => EventCardView(event: items[index]),
        ),
      );
    } else if (snapshot.hasError) {
      return AspectRatio(
        aspectRatio: 2,
        child: Card(
          child: ErrorHandlingRouter(
            error: snapshot.error!,
            stackTrace: snapshot.stackTrace,
            errorHandlingViewType: ErrorHandlingViewType.textOnly,
            retry: () => ref
                .read(eventsViewModel)
                .fetch(true, languageCode: _languageCode ?? 'en'),
          ),
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: 2,
        child: Card(child: DelayedLoadingIndicator(name: context.tr('events'))),
      );
    }
  }
}
