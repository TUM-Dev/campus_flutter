import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/campusComponent/view/event/event_card_view.dart';
import 'package:campus_flutter/campusComponent/view/shared/campus_collection_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/events_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

class EventsScreen extends ConsumerStatefulWidget {
  const EventsScreen({super.key});

  @override
  ConsumerState<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends ConsumerState<EventsScreen> {
  String? _languageCode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final languageCode = context.locale.languageCode;
    if (_languageCode == languageCode) return;
    _languageCode = languageCode;
    ref.read(eventsViewModel).fetch(false, languageCode: languageCode);
  }

  Future<void> _refresh() => ref
      .read(eventsViewModel)
      .fetch(true, languageCode: _languageCode ?? 'en');

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(campusHeilbronnName),
      actions: [
        IconButton(
          onPressed: _refresh,
          tooltip: context.tr('refresh'),
          icon: const Icon(Icons.refresh),
        ),
        IconButton(
          onPressed: () => UrlLauncher.urlString(campusHeilbronnUrl, ref),
          tooltip: context.tr('openWebsite'),
          icon: const Icon(Icons.open_in_new),
        ),
      ],
    ),
    body: StreamBuilder(
      stream: ref.watch(eventsViewModel).events,
      builder: (context, snapshot) => CampusCollectionView(
        label: context.tr('events'),
        icon: Icons.event_outlined,
        onRefresh: _refresh,
        hasData: snapshot.hasData,
        error: snapshot.error,
        stackTrace: snapshot.stackTrace,
        itemCount: snapshot.data?.length ?? 0,
        minimumCardWidth: 260,
        cardAspectRatio: 1,
        cardHeight: 290,
        itemBuilder: (context, index) =>
            EventCardView(event: snapshot.data![index]),
      ),
    ),
  );
}
