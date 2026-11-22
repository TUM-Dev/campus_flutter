import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/campusComponent/view/event/event_card_view.dart';
import 'package:campus_flutter/campusComponent/view/shared/campus_collection_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/events_viewmodel.dart';
import 'package:campus_flutter/homeComponent/view/widget/preference_selection_view.dart';
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
    final model = ref.read(eventsViewModel);
    if (model.events.value == null && !model.events.hasError) {
      model.fetch(false, languageCode: languageCode);
    }
  }

  Future<void> _refresh() async => ref
      .read(eventsViewModel)
      .fetch(true, languageCode: _languageCode ?? 'en');

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: StreamBuilder<int>(
        stream: ref.watch(eventsViewModel).selectedCampus,
        builder: (context, _) => Text(ref.read(eventsViewModel).campusName),
      ),
      actions: [
        IconButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            isScrollControlled: true,
            useSafeArea: true,
            showDragHandle: true,
            builder: (context) => PreferenceSelectionView(
              data: ref.read(eventsViewModel).getCampusEntries(context),
              entry: context.tr('events'),
            ),
          ),
          tooltip: context.tr('filter'),
          icon: const Icon(Icons.filter_list),
        ),
        IconButton(
          onPressed: _refresh,
          tooltip: context.tr('refresh'),
          icon: const Icon(Icons.refresh),
        ),
        IconButton(
          onPressed: () => UrlLauncher.urlString(
            ref.read(eventsViewModel).campusWebsite,
            ref,
          ),
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
        minimumCardWidth: 280,
        cardAspectRatio: 3,
        itemBuilder: (context, index) =>
            EventCardView(event: snapshot.data![index]),
      ),
    ),
  );
}
