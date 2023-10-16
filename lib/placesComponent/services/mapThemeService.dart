import 'package:flutter/services.dart';

class MapThemeService {
  late String darkTheme;
  late String lightTheme;

  MapThemeService() {
    _loadMapThemes();
  }

  _loadMapThemes() async {
    darkTheme =
        await rootBundle.loadString('assets/mapStyles/darkMapTheme.json');
    lightTheme =
        await rootBundle.loadString('assets/mapStyles/lightMapTheme.json');
  }
}
