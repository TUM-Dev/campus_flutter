import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/campusComponent/view/studentClub/student_club_item_view.dart';
import 'package:campus_flutter/campusComponent/viewmodel/student_club_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentClubsScreen extends ConsumerWidget {
  const StudentClubsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.watch(studentClubViewModel).collections,
      builder: (context, snapshot) {
        return DefaultTabController(
          length: snapshot.data?.length ?? 0,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Student Clubs"),
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  for (var collection
                      in snapshot.data ?? <StudentClubCollection>[])
                    Tab(text: collection.title),
                ],
              ),
            ),
            body: () {
              if (snapshot.hasData) {
                return TabBarView(
                  children: [
                    for (var collection in snapshot.data!)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 11,
                          right: 11,
                        ),
                        child: GridView.count(
                          crossAxisCount: crossAxisCount(context),
                          children: [
                            for (var studentClub in collection.clubs)
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(28.0),
                                      ),
                                    ),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: StudentClubItemView(
                                    studentClub: studentClub,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: ErrorHandlingRouter(
                    error: snapshot.error,
                    errorHandlingViewType: ErrorHandlingViewType.fullScreen,
                  ),
                );
              } else {
                return const Center(
                  child: DelayedLoadingIndicator(
                    name: "Student Clubs",
                  ),
                );
              }
            }(),
          ),
        );
      },
    );
  }

  int crossAxisCount(BuildContext context) {
    return MediaQuery.orientationOf(context) == Orientation.landscape
        ? 6
        : MediaQuery.sizeOf(context).width > 600
            ? 4
            : 2;
  }
}
