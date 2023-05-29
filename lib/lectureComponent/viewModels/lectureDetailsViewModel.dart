import 'package:campus_flutter/calendarComponent/model/calendarEvent.dart';
import 'package:campus_flutter/lectureComponent/model/lecture.dart';
import 'package:campus_flutter/lectureComponent/model/lectureDetails.dart';
import 'package:campus_flutter/lectureComponent/services/lectureDetailsService.dart';
import 'package:rxdart/rxdart.dart';

class LectureDetailsViewModel {
  BehaviorSubject<LectureDetails?> lectureDetails = BehaviorSubject.seeded(null);

  final CalendarEvent? event;
  final Lecture? lecture;

  LectureDetailsViewModel({this.event, this.lecture});

  fetchLectureDetails() async {
    if (event != null) {
      lectureDetails.add(await LectureDetailsService.fetchLectureDetails(event!.lvNr ?? ""));
    } else {
      lectureDetails.add(await LectureDetailsService.fetchLectureDetails(lecture!.lvNumber));
    }
  }
}