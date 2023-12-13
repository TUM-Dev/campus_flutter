import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final homeSplitViewModel = Provider((ref) => SplitViewViewModel());
final lectureSplitViewModel = Provider((ref) => SplitViewViewModel());

class SplitViewViewModel {
  BehaviorSubject<Widget?> selectedWidget = BehaviorSubject.seeded(null);
}
