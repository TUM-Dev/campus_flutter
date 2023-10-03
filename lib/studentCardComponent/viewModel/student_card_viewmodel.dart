import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/studentCardComponent/model/student_card.dart';
import 'package:campus_flutter/studentCardComponent/services/student_card_service.dart';
import 'package:rxdart/rxdart.dart';

class StudentCardViewModel implements ViewModel {
  BehaviorSubject<StudentCard?> studentCard = BehaviorSubject.seeded(null);
  BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  @override
  Future fetch(bool forcedRefresh) async {
    StudentCardService.fetchStudentCard(forcedRefresh).then((response) {
      studentCard.add(response.$2);
      lastFetched.add(response.$1);
    }, onError: (error) => studentCard.addError(error));
  }
}
