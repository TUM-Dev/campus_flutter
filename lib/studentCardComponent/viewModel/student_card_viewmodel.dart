import 'package:campus_flutter/studentCardComponent/model/student_card.dart';
import 'package:campus_flutter/studentCardComponent/services/student_card_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final studentCardViewModel = Provider((ref) {
  final model = StudentCardViewModel();
  ref.onDispose(model.dispose);
  return model;
});

class StudentCardViewModel {
  bool _disposed = false;
  BehaviorSubject<List<StudentCard>?> studentCard = BehaviorSubject.seeded(
    null,
  );
  BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);
  final BehaviorSubject<bool> isLoading = BehaviorSubject.seeded(false);

  void dispose() {
    _disposed = true;
    studentCard.close();
    lastFetched.close();
    isLoading.close();
  }

  Future fetch(bool forcedRefresh) async {
    if (_disposed) return;
    isLoading.add(true);
    return StudentCardService.fetchStudentCard(forcedRefresh).then(
      (response) {
        if (_disposed) return;
        studentCard.add(response.$2);
        lastFetched.add(response.$1);
        isLoading.add(false);
      },
      onError: (Object error, StackTrace stack) {
        if (_disposed) return;
        isLoading.add(false);
        studentCard.addError(error, stack);
      },
    );
  }
}
