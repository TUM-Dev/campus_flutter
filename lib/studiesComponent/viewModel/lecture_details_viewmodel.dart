import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/studiesComponent/model/lecture.dart';
import 'package:campus_flutter/studiesComponent/model/lecture_details.dart';
import 'package:campus_flutter/studiesComponent/service/lecture_details_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final lectureDetailsViewModel =
    Provider.family<LectureDetailsViewModel, (CalendarEvent?, Lecture?)>(
      (ref, data) => LectureDetailsViewModel(event: data.$1, lecture: data.$2),
    );

class LectureDetailsViewModel {
  BehaviorSubject<LectureDetails?> lectureDetails = BehaviorSubject.seeded(
    null,
  );

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  final CalendarEvent? event;
  final Lecture? lecture;

  LectureDetailsViewModel({this.event, this.lecture});

  Future fetch(bool forcedRefresh) async {
    if (event != null) {
      LectureDetailsService.fetchLectureDetails(
        event!.lvNr ?? "",
        forcedRefresh,
      ).then((response) {
        lastFetched.add(response.$1);
        lectureDetails.add(response.$2);
      }, onError: (error) => lectureDetails.addError(error));
    } else {
      LectureDetailsService.fetchLectureDetails(
        lecture?.lvNumber ?? "",
        forcedRefresh,
      ).then((response) {
        lastFetched.add(response.$1);
        lectureDetails.add(response.$2);
      }, onError: (error) => lectureDetails.addError(error));
    }
  }
}
