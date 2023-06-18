import 'package:flutter/material.dart';

const Color _primaryLightColor = Color(0xff0065bd);
const Color _primaryDarkColor = Color(0xff3070B3);
const Color _lightBackground = Color(0xfff2f2f7);
const Color _darkBackground = Color(0xff191919);
const Color _lightGray = Color(0xffAAAAAA);
const Color _darkGray = Color(0xff555555);
const Color _almostBlack = Color(0xff1a1c1e);
const Color _almostWhite = Color(0xffe3e2e6);

final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: _primaryLightColor,
        onPrimary: Colors.white,
        secondary: _darkGray,
        onSecondary: _almostBlack,
        error: Colors.red,
        onError: _almostBlack,
        background: _lightBackground,
        onBackground: _lightGray,
        surface: _lightBackground,
        onSurface: _almostBlack
    ),
    primaryColor: _primaryLightColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent
    ),
    bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: Colors.transparent
    ),
    textTheme: const TextTheme(
        titleMedium: TextStyle(color: _primaryLightColor)
    ),
    appBarTheme: const AppBarTheme(
        surfaceTintColor: _lightBackground,
        backgroundColor: _lightBackground),
    cardTheme: const CardTheme(
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)),
    expansionTileTheme: const ExpansionTileThemeData(
        collapsedTextColor: _primaryLightColor,
        collapsedIconColor: _primaryLightColor,
        textColor: _primaryLightColor,
        iconColor: _primaryLightColor),
    buttonTheme: const ButtonThemeData(padding: EdgeInsets.zero, minWidth: 0, layoutBehavior: ButtonBarLayoutBehavior.constrained, highlightColor: Colors.transparent),
    useMaterial3: true,
    dividerColor: Colors.transparent,
    navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        backgroundColor: Color(0xF0F8F9F8),
        surfaceTintColor: Colors.transparent,
        elevation: 50.0));

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: _primaryDarkColor,
        onPrimary: Colors.white,
        secondary: _lightGray,
        onSecondary: _almostWhite,
        error: Colors.red,
        onError: _almostWhite,
        background: _darkBackground,
        onBackground: _almostWhite,
        surface: _darkBackground,
        onSurface: _almostWhite
    ),
    primaryColor: _primaryDarkColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    dialogTheme: const DialogTheme(
        backgroundColor: Color(0xff252525),
        surfaceTintColor: Colors.transparent
    ),
    bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: Colors.transparent
    ),
    textTheme: const TextTheme(
        titleMedium: TextStyle(color: _primaryDarkColor)
    ),
    appBarTheme: const AppBarTheme(
        surfaceTintColor: _darkBackground,
        backgroundColor: _darkBackground),
    cardTheme: const CardTheme(
        color: Color(0xff252525),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)),
    expansionTileTheme: const ExpansionTileThemeData(
        collapsedTextColor: _primaryDarkColor,
        collapsedIconColor: _primaryDarkColor,
        textColor: _primaryDarkColor,
        iconColor: _primaryDarkColor,
    ),
    buttonTheme: const ButtonThemeData(padding: EdgeInsets.zero, minWidth: 0, layoutBehavior: ButtonBarLayoutBehavior.constrained, highlightColor: Colors.transparent),
    useMaterial3: true,
    dividerColor: Colors.transparent,
    navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        backgroundColor: Color(0xF01D1D1D),
        surfaceTintColor: Colors.transparent,
        elevation: 50.0));