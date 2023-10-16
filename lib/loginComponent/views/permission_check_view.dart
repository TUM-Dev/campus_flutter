import 'package:campus_flutter/calendarComponent/services/calendar_service.dart';
import 'package:campus_flutter/gradeComponent/services/grade_service.dart';
import 'package:campus_flutter/lectureComponent/services/lecture_service.dart';
import 'package:campus_flutter/profileComponent/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PermissionCheckView extends ConsumerStatefulWidget {
  const PermissionCheckView({super.key, this.isSettingsView = false});

  final bool isSettingsView;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PermissionCheckViewState();
}

class _PermissionCheckViewState extends ConsumerState<PermissionCheckView> {
  Map<String, bool> confirmedPermissions = {};
  late Future fetchCalendar;
  late Future fetchLecture;
  late Future fetchGrades;
  late Future fetchProfile;
  late Future fetchTuition = Future(() => null);

  @override
  void initState() {
    fetchCalendar = CalendarService.fetchCalendar(true);
    fetchLecture = LectureService.fetchLecture(true);
    fetchGrades = GradeService.fetchGrades(true);
    fetchProfile = ProfileService.fetchProfile(true).then(
        (value) => fetchTuition = ProfileService.fetchTuition(
            true, value.$2.personGroup ?? "", value.$2.id ?? ""),
        onError: (error) =>
            fetchTuition = ProfileService.fetchTuition(true, "", "id"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Check Permissions"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            Expanded(
                flex: 0,
                child: Text(
                  "You can change your permissions on TUMOnline",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                )),
            const Spacer(),
            _permissionCheck("Calendar", fetchCalendar),
            const Spacer(),
            _permissionCheck("Lectures", fetchLecture),
            const Spacer(),
            _permissionCheck("Grades", fetchGrades),
            const Spacer(),
            _permissionCheck("Tuition", fetchTuition),
            const Spacer(),
            _permissionCheck("Identification", fetchProfile),
            const Spacer(flex: 3),
            Visibility(
                visible: confirmedPermissions.keys.length == 5,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: ElevatedButton(
                    onPressed: () {
                      if (widget.isSettingsView) {
                        Navigator.of(context).pop();
                      } else {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      }
                    },
                    child: const Text("Done"))),
            const Spacer(flex: 3)
          ]),
        ));
  }

  Widget _permissionCheck(String name, Future future) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData || snapshot.hasError) {
            Future(() {
              setState(() {
                confirmedPermissions[name] = true;
              });
            });
          }
          return Row(children: [
            Text(name, style: Theme.of(context).textTheme.bodyLarge),
            const Spacer(),
            if (snapshot.hasData)
              const Icon(Icons.check_box, color: Colors.green)
            else if (snapshot.hasError)
              const Icon(Icons.error, color: Colors.red)
            else
              const CircularProgressIndicator.adaptive()
          ]);
        });
  }
}
