import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/campusComponent/model/student_club.dart';
import 'package:campus_flutter/campusComponent/model/student_club_collection.dart';
import 'package:campus_flutter/campusComponent/view/studentClub/student_club_list_tile.dart';
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
  final _search = TextEditingController();
  String? _category;
  bool _hasWebsite = false;

  /// Lower-cased name and description, parsed once per club.
  final _searchText = Expando<String>();

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

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  Future<void> _refresh() async =>
      await ref.read(studentClubViewModel).fetchStudentClubs(true, context);

  bool get _isFiltering => _search.text.trim().isNotEmpty || _hasWebsite;

  bool _matches(StudentClub club) {
    if (_hasWebsite && !club.hasLink) return false;
    final query = _search.text.trim().toLowerCase();
    if (query.isEmpty) return true;
    final text = _searchText[club] ??=
        '${club.parsedName}\n${club.parsedDescription}'.toLowerCase();
    return text.contains(query);
  }

  void _clearFilters() => setState(() {
    _search.clear();
    _hasWebsite = false;
    _category = null;
  });

  void _pickCategory(
    List<({String title, List<StudentClub> clubs})> categories,
    String? selected,
  ) => showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      Widget option(String? title, String label, int count) => ListTile(
        selected: title == selected,
        leading: Icon(title == selected ? Icons.check : null),
        title: Text(label),
        trailing: Text('$count'),
        onTap: () {
          setState(() => _category = title);
          Navigator.pop(context);
        },
      );
      return ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 16),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
            child: Text(
              context.tr('studentClubCategories'),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          option(
            null,
            context.tr('studentClubAllCategories'),
            categories.fold(0, (sum, category) => sum + category.clubs.length),
          ),
          for (final category in categories)
            option(category.title, category.title, category.clubs.length),
        ],
      );
    },
  );

  Widget _header(
    List<({String title, List<StudentClub> clubs})> categories,
    String? selected,
  ) {
    // The app's chip theme only colours the label, so icons follow it.
    final onChip = ChipTheme.of(context).labelStyle?.color;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _search,
            onChanged: (_) => setState(() {}),
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: context.tr('studentClubSearch'),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _search.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () => setState(_search.clear),
                      tooltip: MaterialLocalizations.of(context)
                          .deleteButtonTooltip,
                      icon: const Icon(Icons.clear),
                    ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              isDense: true,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Flexible(
                child: FilterChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          selected ?? context.tr('studentClubAllCategories'),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, size: 18, color: onChip),
                    ],
                  ),
                  selected: selected != null,
                  onSelected: (_) => _pickCategory(categories, selected),
                ),
              ),
              const SizedBox(width: 8),
              // Leaves at least half the row to the category on narrow screens.
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width / 2,
                ),
                child: FilterChip(
                  avatar: Icon(Icons.link, color: onChip),
                  label: Text(
                    context.tr('studentClubHasWebsite'),
                    overflow: TextOverflow.ellipsis,
                  ),
                  selected: _hasWebsite,
                  onSelected: (value) => setState(() => _hasWebsite = value),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
    stream: ref.watch(studentClubViewModel).collections,
    builder: (context, snapshot) {
      final collections = snapshot.data ?? [];
      final categories = [
        for (final collection in collections)
          (
            title: collection.parsedTitle,
            clubs: collection.clubs.where(_matches).toList(),
          ),
      ];
      final selected = categories
          .where((category) => category.title == _category)
          .firstOrNull;
      final sections = [
        for (final category in selected == null ? categories : [selected])
          CampusCollectionSection(
            title: category.title,
            trailing: '${category.clubs.length}',
            itemCount: category.clubs.length,
            itemBuilder: (context, index) =>
                StudentClubListTile(studentClub: category.clubs[index]),
          ),
      ];

      return Scaffold(
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
        ),
        body: CampusCollectionView(
          label: context.tr('studentClubs'),
          icon: Icons.groups_outlined,
          storageKey: 'clubs-${selected?.title ?? 'all'}',
          onRefresh: _refresh,
          hasData: snapshot.hasData,
          error: snapshot.error,
          stackTrace: snapshot.stackTrace,

          sections: sections,
          header: collections.isEmpty
              ? null
              : _header(categories, selected?.title),
          emptyMessage: _isFiltering
              ? context.tr('studentClubNoMatches')
              : null,
          emptyAction: _isFiltering
              ? TextButton.icon(
                  onPressed: _clearFilters,
                  icon: const Icon(Icons.filter_alt_off_outlined),
                  label: Text(context.tr('studentClubClearFilters')),
                )
              : null,
          minimumCardWidth: 340,
        ),
      );
    },
  );
}
