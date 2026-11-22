import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/campusComponent/model/campus_event.dart';
import 'package:campus_flutter/campusComponent/view/event/event_card_view.dart';
import 'package:campus_flutter/campusComponent/view/shared/campus_carousel_inset.dart';
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
        titleWidget: CampusSectionHeading(
          title: campusHeilbronnName,
          onMore: () => context.push(events),
        ),
        child: _body(snapshot),
      );
    },
  );

  Widget _body(AsyncSnapshot<List<CampusEvent>?> snapshot) {
    if (snapshot.hasData) {
      final textScale = MediaQuery.textScalerOf(context).scale(14) / 14;
      return SizedBox(
        height: 300 * textScale,
        child: CampusCarouselInset(
          child: CarouselView(
            itemExtent: 240,
            shrinkExtent: 240,
            itemSnapping: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            enableSplash: false,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            children: [
              for (final event in snapshot.data!.take(10))
                EventCardView(event: event, compact: true),
            ],
          ),
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
