import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/campusComponent/service/student_club_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final studentClubViewModel = Provider((ref) => StudentClubViewModel());

class StudentClubViewModel {
  final BehaviorSubject<List<StudentClubCollection>?> collections =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<List<StudentClub>?> suggestions =
      BehaviorSubject.seeded(null);

  Future fetchStudentClubs(bool forceRefresh) {
    return StudentClubService.fetchStudentClubs(forceRefresh).then(
      (value) {
        collections.add(value.$2);
        final studentClubs = value.$2.expand((e) => e.clubs).toList();
        studentClubs.shuffle();
        suggestions.add(studentClubs.take(5).toList());
      },
      onError: (error) {
        collections.addError(error);
        suggestions.addError(error);
      },
    );
  }
}
