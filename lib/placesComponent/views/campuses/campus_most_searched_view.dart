import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_campus_viewmodel.dart';
import 'package:campus_flutter/navigaTumComponent/views/navigatum_room_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampusMostSearchedView extends ConsumerWidget {
  const CampusMostSearchedView({
    super.key,
    required this.campus,
  });

  final Campus campus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
      title: context.localizations.mostSearchedRooms,
      child: Card(
        child: StreamBuilder(
          stream:
              ref.watch(navigaTumCampusViewModel(campus)).mostSearchedResults,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Padding(
                  padding: EdgeInsets.all(context.padding),
                  child: Center(
                    child: Text(
                      context.localizations.noEntriesFound(
                        context.localizations.rooms,
                      ),
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    for (var entity in snapshot.data!.indexed) ...[
                      ListTile(
                        title: Text(entity.$2.getFormattedName()),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NavigaTumRoomScaffold(
                              id: entity.$2.id,
                            ),
                          ),
                        ),
                      ),
                      if (entity.$1 < snapshot.data!.length - 1)
                        const PaddedDivider(
                          height: 0,
                        ),
                    ],
                  ],
                );
              }
            } else if (snapshot.hasError) {
              return const Text("Error");
            } else {
              return Padding(
                padding: EdgeInsets.all(context.padding),
                child: const DelayedLoadingIndicator(
                  name: "Most Searched Rooms",
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
