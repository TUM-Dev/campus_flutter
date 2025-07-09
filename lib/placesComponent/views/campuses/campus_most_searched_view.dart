import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_campus_viewmodel.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CampusMostSearchedView extends ConsumerWidget {
  const CampusMostSearchedView({super.key, required this.campus});

  final Campus campus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
      title: context.tr("mostSearchedRooms"),
      child: Card(
        child: StreamBuilder(
          stream: ref
              .watch(navigaTumCampusViewModel(campus))
              .mostSearchedResults,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Padding(
                  padding: EdgeInsets.all(context.padding),
                  child: Center(
                    child: Text(
                      context.tr("noEntriesFound", args: [context.tr("rooms")]),
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    for (var entity in snapshot.data!.indexed) ...[
                      ListTile(
                        title: Text(entity.$2.getFormattedName()),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                        onTap: () =>
                            context.push(navigaTum, extra: entity.$2.id),
                      ),
                      if (entity.$1 < snapshot.data!.length - 1)
                        const PaddedDivider(height: 0),
                    ],
                  ],
                );
              }
            } else if (snapshot.hasError) {
              return ListTile(
                title: ErrorHandlingRouter(
                  error: snapshot.error!,
                  errorHandlingViewType: ErrorHandlingViewType.descriptionOnly,
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.all(context.padding),
                child: DelayedLoadingIndicator(
                  name: context.tr("mostSearchedRooms"),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
