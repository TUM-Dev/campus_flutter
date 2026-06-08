import 'package:campus_flutter/studentCardComponent/model/student_card.dart';
import 'package:campus_flutter/studentCardComponent/services/student_card_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final studentCardViewModel = Provider((ref) => StudentCardViewModel());

class StudentCardViewModel {
  BehaviorSubject<List<StudentCard>?> studentCard = BehaviorSubject.seeded(
    null,
  );
  BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);
  final BehaviorSubject<bool> isLoading = BehaviorSubject.seeded(false);

  Future fetch(bool forcedRefresh) async {
    isLoading.add(true);
    return StudentCardService.fetchStudentCard(forcedRefresh).then(
      (response) {
        studentCard.add(response.$2);
        lastFetched.add(response.$1);
        isLoading.add(false);
      },
      onError: (error) {
        isLoading.add(false);
        studentCard.addError(error);
      },
    );
  }
}
