import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/placesComponent/viewModels/places_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_card_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
                    child: _studyRoomsTile(context),
                  ),
                ),
                Expanded(
                  child: Card(
                    margin: EdgeInsets.only(left: context.halfPadding),
                    child: _cafeteriasTile(context),
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
          Card(child: _studyRoomsTile(context)),
          Card(child: _cafeteriasTile(context)),
          const PaddedDivider(),
          for (var campus in ref.watch(placesViewModel).campuses)
            CampusCardView(campus: campus),
        ],
      ),
    );
  }

  Widget _studyRoomsTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.school),
      title: Text(context.tr("studyRooms")),
      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
      onTap: () => context.push(studyRooms),
    );
  }

  Widget _cafeteriasTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.restaurant),
      title: Text(context.tr("cafeterias")),
      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
      onTap: () => context.push(cafeterias),
    );
  }
}
