import 'package:campus_flutter/campusComponent/view/shared/campus_carousel_inset.dart';
import 'package:campus_flutter/campusComponent/view/shared/campus_section_heading.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/campusComponent/view/studentClub/student_club_card_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/student_club_viewmodel.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StudentClubWidgetView extends ConsumerStatefulWidget {
  const StudentClubWidgetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StudentClubWidgetViewState();
}

class _StudentClubWidgetViewState extends ConsumerState<StudentClubWidgetView> {
  @override
  void didChangeDependencies() {
    ref.read(studentClubViewModel).fetchStudentClubs(false, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetFrameView(
      titleWidget: CampusSectionHeading(
        title: context.tr("studentClubs"),
        onMore: () => context.push(studentClubs),
      ),
      child: StreamBuilder(
        stream: ref.watch(studentClubViewModel).suggestions,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Padding(
                padding: EdgeInsets.all(context.padding),
                child: Text(
                  context.tr(
                    'noEntriesFound',
                    args: [context.tr('studentClubs')],
                  ),
                ),
              );
            }
            return SizedBox(
              height: StudentClubCardView.heightFor(context) + 8,
              child: CampusCarouselInset(
                child: CarouselView(
                  itemExtent: 200,
                  shrinkExtent: 200,
                  itemSnapping: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enableSplash: false,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  children: [
                    for (final club in snapshot.data!.take(8))
                      StudentClubCardView(studentClub: club),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return AspectRatio(
              aspectRatio: 2,
              child: Card(
                child: ErrorHandlingRouter(
                  error: snapshot.error!,
                  stackTrace: snapshot.stackTrace,

                  errorHandlingViewType: ErrorHandlingViewType.textOnly,
                  retry: () => ref
                      .read(studentClubViewModel)
                      .fetchStudentClubs(true, context),
                ),
              ),
            );
          } else {
            return const AspectRatio(
              aspectRatio: 2,
              child: Card(
                child: DelayedLoadingIndicator(name: "Student Clubs"),
              ),
            );
          }
        },
      ),
    );
  }
}
