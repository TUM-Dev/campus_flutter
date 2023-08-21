import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/lectureComponent/views/lecture_details_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarSearchResultView extends ConsumerWidget {
  const CalendarSearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
        title: "Calendar",
        child: Card(
            child: StreamBuilder(
          stream: ref.watch(calendarSearchViewModel).searchResults,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                        child: ListTile(
                          title: Text(snapshot.data![index].$1.title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconText(
                                iconData: Icons.hourglass_top,
                                label: snapshot.data![index].$1.timeDatePeriod,
                                iconColor: Theme.of(context).primaryColor,
                              ),
                              IconText(
                                iconData: Icons.location_pin,
                                label: snapshot.data![index].$1.location,
                                iconColor: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          ref.read(selectedEvent.notifier).state =
                              snapshot.data![index].$1;
                          ref.read(selectedLecture.notifier).state = null;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Scaffold(
                                  appBar: AppBar(
                                    leading: const BackButton(),
                                  ),
                                  body: const SafeArea(
                                      child: LectureDetailsView()))));
                        }),
                    separatorBuilder: (context, index) => const PaddedDivider(
                          height: 0,
                        ),
                    itemCount:
                        snapshot.data!.length >= 3 ? 3 : snapshot.data!.length);
              } else {
                return Padding(
                    padding: EdgeInsets.all(context.padding),
                    child: const Center(
                      child: Text("No Upcoming Events"),
                    ));
              }
            } else if (snapshot.hasError) {
              return ErrorHandlingView(
                  error: snapshot.error!,
                  errorHandlingViewType: ErrorHandlingViewType.descriptionOnly);
            } else {
              return const DelayedLoadingIndicator(
                name: "Calendar",
              );
            }
          },
        )));
  }
}
