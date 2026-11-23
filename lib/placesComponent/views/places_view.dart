import 'dart:math' as math;

import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:campus_flutter/placesComponent/viewModels/places_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_card_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class PlacesView extends ConsumerWidget {
  const PlacesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(placesViewModel);
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 600;
            final columns = constraints.maxWidth >= 900
                ? 4
                : constraints.maxWidth >= 600
                ? 3
                : 2;
            final spacing = context.padding;
            final cardWidth = math.max(
              0.0,
              (constraints.maxWidth - (columns + 1) * spacing) / columns,
            );
            final textScale = MediaQuery.textScalerOf(context).scale(14) / 14;
            final cardHeight = cardWidth / 1.6 + 52 * textScale.clamp(1.0, 1.4);

            return StreamBuilder<List<Campus>>(
              stream: vm.campuses,
              initialData: vm.campuses.value,
              builder: (context, snapshot) {
                final campuses = snapshot.data ?? const <Campus>[];
                return CustomScrollView(
                  key: const PageStorageKey('places'),
                  slivers: [
                    SliverToBoxAdapter(
                      child: isWide
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: spacing,
                                vertical: context.halfPadding,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Card(
                                      margin: EdgeInsets.only(
                                        right: spacing / 2,
                                      ),
                                      child: _studyRoomsTile(context),
                                    ),
                                  ),
                                  Expanded(
                                    child: Card(
                                      margin: EdgeInsets.only(
                                        left: spacing / 2,
                                      ),
                                      child: _cafeteriasTile(context),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                Card(child: _studyRoomsTile(context)),
                                Card(child: _cafeteriasTile(context)),
                              ],
                            ),
                    ),
                    const SliverToBoxAdapter(child: PaddedDivider()),
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(
                        spacing,
                        context.halfPadding,
                        spacing,
                        spacing,
                      ),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          mainAxisSpacing: spacing,
                          crossAxisSpacing: spacing,
                          mainAxisExtent: cardHeight,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              CampusCardView(campus: campuses[index]),
                          childCount: campuses.length,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
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
