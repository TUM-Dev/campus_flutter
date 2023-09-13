import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/base/helpers/tapable.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/cafeterias_view.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_card_view.dart';
import 'package:campus_flutter/placesComponent/views/studyGroups/study_rooms_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesView extends ConsumerWidget {
  const PlacesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return _landscapeOrientation(context, ref);
      } else {
        return _portraitOrientation(context, ref);
      }
    });
  }

  Widget _landscapeOrientation(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
            flex: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Tapable(
                        child: AspectRatio(
                            aspectRatio: 8,
                            child: CardWithPadding(
                                margin: EdgeInsets.only(
                                    left: context.padding,
                                    right: context.padding / 2,
                                    bottom: context.halfPadding),
                                child: Row(
                                  children: [
                                    IconText(
                                        iconData: Icons.school,
                                        label: context.localizations.studyRooms,
                                        iconSize: 24),
                                    const Spacer(),
                                    const Icon(Icons.arrow_forward_ios,
                                        size: 15)
                                  ],
                                ))),
                        action: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const StudyRoomsScaffold())))),
                Expanded(
                    child: Tapable(
                        child: AspectRatio(
                            aspectRatio: 8,
                            child: CardWithPadding(
                                margin: EdgeInsets.only(
                                    right: context.padding,
                                    left: context.padding / 2,
                                    bottom: context.halfPadding),
                                child: Row(
                                  children: [
                                    IconText(
                                        iconData: Icons.restaurant,
                                        label: context.localizations.cafeterias,
                                        iconSize: 24),
                                    const Spacer(),
                                    const Icon(Icons.arrow_forward_ios,
                                        size: 15)
                                  ],
                                ))),
                        action: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CafeteriasScaffold())))),
              ],
            )),
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
                    top: context.halfPadding),
                children: [
              for (var campus in ref.watch(placesViewModel).campuses)
                CampusCardView(
                  campus: campus,
                  margin: EdgeInsets.zero,
                ),
            ]))
      ],
    );
  }

  Widget _portraitOrientation(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Tapable(
            child: AspectRatio(
                aspectRatio: 6,
                child: CardWithPadding(
                    child: Row(
                  children: [
                    IconText(
                        iconData: Icons.school,
                        label: context.localizations.studyRooms,
                        iconSize: 24),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios, size: 15)
                  ],
                ))),
            action: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const StudyRoomsScaffold()))),
        Tapable(
            child: AspectRatio(
                aspectRatio: 6,
                child: CardWithPadding(
                    child: Row(
                  children: [
                    IconText(
                        iconData: Icons.restaurant,
                        label: context.localizations.cafeterias,
                        iconSize: 24),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios, size: 15)
                  ],
                ))),
            action: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CafeteriasScaffold()))),
        const PaddedDivider(),
        for (var campus in ref.watch(placesViewModel).campuses)
          CampusCardView(campus: campus),
      ],
    ));
  }
}
