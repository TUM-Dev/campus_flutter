import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const Color primaryLightColor = Color(0xff0065bd);
const Color primaryDarkColor = Color(0xff3070B3);

var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;

final Color primaryColor = isDarkMode ? primaryDarkColor : primaryLightColor;

final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: primaryLightColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: const Color(0xfff2f2f7),
    textTheme: const TextTheme(
        labelLarge: TextStyle(color: primaryLightColor),
        titleMedium: TextStyle(color: primaryLightColor)
    ),
    appBarTheme: const AppBarTheme(
        surfaceTintColor: Color(0xfff2f2f7),
        backgroundColor: Color(0xfff2f2f7)),
    cardTheme: const CardTheme(
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent),
    expansionTileTheme: const ExpansionTileThemeData(
        collapsedTextColor: primaryLightColor,
        collapsedIconColor: primaryLightColor,
        textColor: primaryLightColor,
        iconColor: primaryLightColor),
    useMaterial3: true,
    dividerColor: Colors.transparent,
    navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        backgroundColor: Color(0xF0F8F9F8),
        surfaceTintColor: Colors.transparent,
        elevation: 50.0));

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: primaryDarkColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: const Color(0xff191919),
    textTheme: const TextTheme(
        labelLarge: TextStyle(color: primaryDarkColor),
        titleMedium: TextStyle(color: primaryDarkColor)
    ),
    appBarTheme: const AppBarTheme(
        surfaceTintColor: Color(0xff191919),
        backgroundColor: Color(0xff191919)),
    cardTheme: const CardTheme(
        color: Color(0xff252525),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent),
    expansionTileTheme: const ExpansionTileThemeData(
        collapsedTextColor: primaryDarkColor,
        collapsedIconColor: primaryDarkColor,
        textColor: primaryDarkColor,
        iconColor: primaryDarkColor,
    ),
    useMaterial3: true,
    dividerColor: Colors.transparent,
    navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        backgroundColor: Color(0xF01D1D1D),
        surfaceTintColor: Colors.transparent,
        elevation: 50.0));