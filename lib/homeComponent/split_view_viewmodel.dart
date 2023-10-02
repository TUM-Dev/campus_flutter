import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SplitViewViewModel {
  BehaviorSubject<Widget?> selectedWidget = BehaviorSubject.seeded(null);
}
