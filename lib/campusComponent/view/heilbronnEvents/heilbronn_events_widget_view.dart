import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/grid_utility.dart';
import 'package:campus_flutter/campusComponent/model/heilbronn_event.dart';
import 'package:campus_flutter/campusComponent/view/heilbronnEvents/heilbronn_event_card_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/heilbronn_events_viewmodel.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeilbronnEventsWidgetView extends ConsumerStatefulWidget {
  const HeilbronnEventsWidgetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HeilbronnEventsWidgetViewState();
}

class _HeilbronnEventsWidgetViewState
    extends ConsumerState<HeilbronnEventsWidgetView> {
  String? _languageCode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final languageCode = context.locale.languageCode;
    if (_languageCode == languageCode) return;
    _languageCode = languageCode;
    ref.read(heilbronnEventsViewModel).fetch(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.watch(heilbronnEventsViewModel).isNearHeilbronn,
      builder: (context, nearbySnapshot) {
        if (nearbySnapshot.data == false) {
          return const SizedBox.shrink();
        }

        return StreamBuilder(
          stream: ref.watch(heilbronnEventsViewModel).events,
          builder: (context, eventsSnapshot) {
            return WidgetFrameView(
              titleWidget: Text(
                'Campus Heilbronn Events',
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              child: _body(eventsSnapshot),
            );
          },
        );
      },
    );
  }

  Widget _body(AsyncSnapshot<List<HeilbronnEvent>?> snapshot) {
    if (snapshot.hasData) {
      if (snapshot.data!.isEmpty) {
        return AspectRatio(
          aspectRatio: 2,
          child: Card(
            child: Center(
              child: Text(
                'noUpcomingEvents'.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        );
      }
      final events = snapshot.data!
          .take(GridUtility.campusNumberOfItems(context))
          .toList();
      final textScale = MediaQuery.textScalerOf(context).scale(1);
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: context.padding),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: events.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: GridUtility.campusEventsCrossAxisCount(context),
            mainAxisSpacing: context.padding,
            crossAxisSpacing: context.padding,
            mainAxisExtent: 128 * textScale,
          ),
          itemBuilder: (context, index) =>
              HeilbronnEventCardView(event: events[index]),
        ),
      );
    } else if (snapshot.hasError) {
      return AspectRatio(
        aspectRatio: 2,
        child: Card(
          child: ErrorHandlingRouter(
            error: snapshot.error,
            errorHandlingViewType: ErrorHandlingViewType.textOnly,
            retry: (() => ref
                .read(heilbronnEventsViewModel)
                .fetch(context.locale.languageCode)),
          ),
        ),
      );
    } else {
      return const AspectRatio(
        aspectRatio: 2,
        child: Card(
          child: DelayedLoadingIndicator(name: 'Campus Heilbronn Events'),
        ),
      );
    }
  }
}
