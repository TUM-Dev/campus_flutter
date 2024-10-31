import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/grid_utility.dart';
import 'package:campus_flutter/campusComponent/view/studentClub/student_club_grid_view.dart';
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
      titleWidget: Row(
        children: [
          Text(
            "Student Clubs",
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          InkWell(
            child: Text(
              context.tr("more"),
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => context.push(studentClubs),
          ),
        ],
      ),
      child: StreamBuilder(
        stream: ref.watch(studentClubViewModel).suggestions,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return StudentClubGridView(
              studentClubs: snapshot.data!
                  .take(GridUtility.campusNumberOfItems(context))
                  .toList(),
              padding: EdgeInsets.symmetric(horizontal: context.padding),
              crossAxisCount: GridUtility.campusPaddedCrossAxisCount(context),
              withinScrollView: true,
            );
          } else if (snapshot.hasError) {
            return AspectRatio(
              aspectRatio: 2,
              child: Card(
                child: ErrorHandlingRouter(
                  error: Error(),
                  errorHandlingViewType: ErrorHandlingViewType.textOnly,
                ),
              ),
            );
          } else {
            return const AspectRatio(
              aspectRatio: 2,
              child: Card(
                child: DelayedLoadingIndicator(
                  name: "Student Clubs",
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
