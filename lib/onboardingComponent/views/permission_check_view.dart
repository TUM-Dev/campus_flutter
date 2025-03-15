import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/calendarComponent/services/calendar_service.dart';
import 'package:campus_flutter/personComponent/services/profile_service.dart';
import 'package:campus_flutter/studiesComponent/service/grade_service.dart';
import 'package:campus_flutter/studiesComponent/service/lecture_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      (value) =>
          fetchTuition = ProfileService.fetchTuition(
            true,
            value.$2.personGroup ?? "",
            value.$2.id ?? "",
          ),
      onError:
          (error) => fetchTuition = ProfileService.fetchTuition(true, "", "id"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        widget.isSettingsView
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).canvasColor
            : Colors.white;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: widget.isSettingsView ? const CustomBackButton() : null,
        title: Text(context.tr("checkPermissions")),
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Text(
                context.tr("permissionChangePossibleInTUMonline"),
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            _permissionCheck(context.tr("calendar"), fetchCalendar),
            const Spacer(),
            _permissionCheck(context.tr("lectures"), fetchLecture),
            const Spacer(),
            _permissionCheck(context.tr("grades"), fetchGrades),
            const Spacer(),
            _permissionCheck(context.tr("tuition"), fetchTuition),
            const Spacer(),
            _permissionCheck(context.tr("identification"), fetchProfile),
            const Spacer(flex: 3),
            Visibility(
              visible: confirmedPermissions.keys.length == 5,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: ElevatedButton(
                onPressed: () {
                  if (widget.isSettingsView) {
                    context.pop();
                  } else {
                    context.push(locationPermission);
                  }
                },
                child: Text(
                  widget.isSettingsView
                      ? context.tr("back")
                      : context.tr("continueOnboarding"),
                ),
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
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
        return Row(
          children: [
            Text(name, style: Theme.of(context).textTheme.bodyLarge),
            const Spacer(),
            if (snapshot.hasData)
              const Icon(Icons.check_box, color: Colors.green)
            else if (snapshot.hasError)
              const Icon(Icons.error, color: Colors.red)
            else
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 24, maxWidth: 24),
                child: const CircularProgressIndicator.adaptive(),
              ),
          ],
        );
      },
    );
  }
}
