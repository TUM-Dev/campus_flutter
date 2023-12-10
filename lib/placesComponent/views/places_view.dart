import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/cafeterias_view.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_card_view.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_rooms_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesView extends ConsumerWidget {
  const PlacesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return _landscapeOrientation(context, ref);
        } else {
          return _portraitOrientation(context, ref);
        }
      },
    );
  }

  Widget _landscapeOrientation(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          flex: 0,
          child: Padding(
            padding: EdgeInsets.only(
              left: context.padding,
              right: context.padding,
              top: context.halfPadding,
              bottom: context.halfPadding,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.only(right: context.halfPadding),
                    child: ListTile(
                      leading: const Icon(Icons.school),
                      title: Text(context.localizations.studyRooms),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const StudyRoomsScaffold(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    margin: EdgeInsets.only(left: context.halfPadding),
                    child: ListTile(
                      leading: const Icon(Icons.restaurant),
                      title: Text(context.localizations.cafeterias),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CafeteriasScaffold(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const PaddedDivider(),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
            mainAxisSpacing: context.padding,
            crossAxisSpacing: context.padding,
            padding: EdgeInsets.only(
              left: context.padding,
              right: context.padding,
              top: context.halfPadding,
            ),
            children: [
              for (var campus in ref.watch(placesViewModel).campuses)
                CampusCardView(
                  campus: campus,
                  margin: EdgeInsets.zero,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _portraitOrientation(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.school),
              title: Text(context.localizations.studyRooms),
              trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StudyRoomsScaffold(),
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.restaurant),
              title: Text(context.localizations.cafeterias),
              trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CafeteriasScaffold(),
                ),
              ),
            ),
          ),
          const PaddedDivider(),
          for (var campus in ref.watch(placesViewModel).campuses)
            CampusCardView(campus: campus),
        ],
      ),
    );
  }
}
