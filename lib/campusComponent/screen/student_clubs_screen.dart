import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/campusComponent/model/student_club_collection.dart';
import 'package:campus_flutter/campusComponent/view/studentClub/student_club_card_view.dart';
import 'package:campus_flutter/campusComponent/view/shared/campus_collection_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/student_club_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentClubsScreen extends ConsumerStatefulWidget {
  const StudentClubsScreen({super.key});

  @override
  ConsumerState<StudentClubsScreen> createState() => _StudentClubsScreenState();
}

class _StudentClubsScreenState extends ConsumerState<StudentClubsScreen> {
  Locale? _locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = context.locale;
    final model = ref.read(studentClubViewModel);
    if ((_locale != null && _locale != locale) ||
        (_locale == null &&
            model.collections.value == null &&
            !model.collections.hasError)) {
      model.fetchStudentClubs(false, context);
    }
    _locale = locale;
  }

  Future<void> _refresh() async =>
      await ref.read(studentClubViewModel).fetchStudentClubs(true, context);

  @override
  Widget build(BuildContext context) => StreamBuilder(
    stream: ref.watch(studentClubViewModel).collections,
    builder: (context, snapshot) {
      final collections = snapshot.data ?? [];
      Widget collection(int? index) {
        final items = index == null ? null : collections[index].clubs;
        return CampusCollectionView(
          label: context.tr('studentClubs'),
          icon: Icons.groups_outlined,
          storageKey: index == null
              ? 'clubs-empty'
              : 'clubs-${collections[index].parsedTitle}',
          onRefresh: _refresh,
          hasData: snapshot.hasData,
          error: snapshot.error,

          itemCount: items?.length ?? 0,
          minimumCardWidth: 160,
          cardAspectRatio: 1,
          itemBuilder: (context, index) =>
              StudentClubCardView(studentClub: items![index]),
        );
      }

      return DefaultTabController(
        length: collections.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.tr('studentClubs')),
            actions: [
              IconButton(
                onPressed: _refresh,
                tooltip: context.tr('refresh'),
                icon: const Icon(Icons.refresh),
              ),
              IconButton(
                onPressed: () => UrlLauncher.urlString(
                  context.locale.languageCode == 'de'
                      ? 'https://www.sv.tum.de/sv/hochschulgruppen/'
                      : 'https://www.sv.tum.de/en/sv/student-groups/',
                  ref,
                ),
                tooltip: context.tr('openWebsite'),
                icon: const Icon(Icons.open_in_new),
              ),
            ],
            bottom: collections.isEmpty
                ? null
                : TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      for (final collection in collections)
                        Tab(text: collection.parsedTitle),
                    ],
                  ),
          ),
          body: collections.isEmpty
              ? collection(null)
              : TabBarView(
                  children: [
                    for (var index = 0; index < collections.length; index++)
                      collection(index),
                  ],
                ),
        ),
      );
    },
  );
}
