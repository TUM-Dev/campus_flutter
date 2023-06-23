import 'package:campus_flutter/calendarComponent/services/calendarService.dart';
import 'package:campus_flutter/gradeComponent/services/gradeService.dart';
import 'package:campus_flutter/lectureComponent/services/lectureService.dart';
import 'package:campus_flutter/profileComponent/services/profileService.dart';
import 'package:campus_flutter/profileComponent/viewModel/profileViewModel.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PermissionCheckView extends ConsumerStatefulWidget {
  const PermissionCheckView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PermissionCheckViewState();
}

class _PermissionCheckViewState extends ConsumerState<PermissionCheckView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Check Permissions"),
      ),
      body: Column(children: [
        _permissionCheck("Calendar", CalendarService.fetchCalendar(true)),
        _permissionCheck("Lectures", LectureService.fetchLecture(true)),
        _permissionCheck("Grades", GradeService.fetchGrades(true)),
        _permissionCheck("Profile", ProfileService.fetchProfile(true)),
        FutureBuilder(
            future: GradeService.fetchGrades(true),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const Icon(Icons.check);
              } else if (snapshot.hasError) {
                return const Icon(Icons.error);
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ]),
    );
  }

  Widget _permissionCheck(String name, Future future) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          return Row(
            children: [
              Text(name),
              if (snapshot.hasData)
                const Icon(Icons.check)
              else if (snapshot.hasError)
                const Icon(Icons.error)
              else
                const CircularProgressIndicator()
            ]
          );
        });
  }
}