import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/calendarComponent/model/calendarEvent.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/model/lectureDetails.dart';
import 'package:campus_flutter/lectureComponent/services/lectureDetailsService.dart';
import 'package:rxdart/rxdart.dart';

class LectureDetailsViewModel implements ViewModel {
  BehaviorSubject<(DateTime?, LectureDetails)?> lectureDetails = BehaviorSubject.seeded(null);

  final CalendarEvent? event;
  final Lecture? lecture;

  LectureDetailsViewModel({this.event, this.lecture});

  @override
  Future fetch(bool forcedRefresh) async {
    if (event != null) {
      LectureDetailsService.fetchLectureDetails(event!.lvNr ?? "", forcedRefresh).then((response) {
        lectureDetails.add(response);
      }, onError: (error) => lectureDetails.addError(error));
    } else {
      LectureDetailsService.fetchLectureDetails(lecture?.lvNumber ?? "", forcedRefresh).then((response) {
        lectureDetails.add(response);
      }, onError: (error) => lectureDetails.addError(error));
    }
  }
}