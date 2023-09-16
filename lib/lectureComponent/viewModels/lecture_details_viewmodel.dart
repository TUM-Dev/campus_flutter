import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/calendarComponent/model/calendar_event.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/model/lecture_details.dart';
import 'package:campus_flutter/lectureComponent/services/lecture_details_service.dart';
import 'package:rxdart/rxdart.dart';

class LectureDetailsViewModel implements ViewModel {
  BehaviorSubject<LectureDetails?> lectureDetails =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  final CalendarEvent? event;
  final Lecture? lecture;

  LectureDetailsViewModel({this.event, this.lecture}) {
    fetch(false);
  }

  @override
  Future fetch(bool forcedRefresh) async {
    if (event != null) {
      LectureDetailsService.fetchLectureDetails(
              event!.lvNr ?? "", forcedRefresh)
          .then((response) {
        lastFetched.add(response.$1);
        lectureDetails.add(response.$2);
      }, onError: (error) => lectureDetails.addError(error));
    } else {
      LectureDetailsService.fetchLectureDetails(
              lecture?.lvNumber ?? "", forcedRefresh)
          .then((response) {
        lastFetched.add(response.$1);
        lectureDetails.add(response.$2);
      }, onError: (error) => lectureDetails.addError(error));
    }
  }
}
