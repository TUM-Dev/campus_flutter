import 'package:campus_flutter/placesComponent/model/cafeterias/mensa_menu.dart';

/// local class
class CafeteriaMenu {
  final DateTime date;
  final List<MenuCategory> categories;

  CafeteriaMenu({
    required this.date,
    required this.categories
  });
}