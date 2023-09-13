import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const Color _primaryLightColor = Color(0xff0064BC);
const Color _primaryDarkColor = Color(0xff3070B3);
const Color _lightBackground = Color(0xfff2f2f7);
const Color _darkBackground = Color(0xff191919);
const Color _lightGray = Color(0xffAAAAAA);
const Color _navigationIconGrayLight = Color(0xffA0A0A1);
const Color _navigationIconGrayDark = Color(0xff808080);
const Color _darkGray = Color(0xff555555);
const Color _almostBlack = Color(0xff1a1c1e);
const Color _almostWhite = Color(0xffe3e2e6);

extension ContextTheme on BuildContext {
  double get halfPadding => 5.0;
  double get padding => 15.0;
}

extension Localization on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}

/// light theme
ThemeData lightTheme(BuildContext context) {
  return ThemeData(

      /// for light mode
      brightness: Brightness.light,

      /// basic color scheme
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
          onSurface: _almostBlack),

      /// ensures Theme.of(context).primaryColor is usable
      primaryColor: _primaryLightColor,

      /// remove splash effect on e.g. IconButtons
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,

      /// custom elevated button styling
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade300;
                } else {
                  return _primaryLightColor;
                }
              }),
              foregroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
              shape: MaterialStateProperty.resolveWith((states) =>
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))))),

      /// remove tint of dialogs
      dialogTheme: const DialogTheme(
          backgroundColor: Colors.white, surfaceTintColor: Colors.transparent),

      /// remove tint of sheets
      bottomSheetTheme:
          const BottomSheetThemeData(surfaceTintColor: Colors.transparent),

      /// adjust some text colors
      textTheme: const TextTheme(
          labelLarge: TextStyle(color: _primaryLightColor),
          titleMedium: TextStyle(color: _primaryLightColor)),

      /// remove change of color if scrollView is behind
      appBarTheme: const AppBarTheme(
          surfaceTintColor: _lightBackground,
          backgroundColor: _lightBackground),

      /// remove colored tint and shadow of card, add margin
      cardTheme: CardTheme(
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          margin: EdgeInsets.symmetric(
              vertical: context.halfPadding, horizontal: context.padding)),

      /// set all title colors of expansion tile to the same color
      expansionTileTheme: const ExpansionTileThemeData(
          collapsedTextColor: _primaryLightColor,
          collapsedIconColor: _primaryLightColor,
          textColor: _primaryLightColor,
          iconColor: _primaryLightColor),

      /// use material 3 widgets
      useMaterial3: true,

      ///
      dividerColor: Colors.transparent,

      ///
      dividerTheme: const DividerThemeData(color: Color(0xffE3E3E4)),

      /// remove indicator and tint, color selected icon + label
      navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: _primaryLightColor, fontWeight: FontWeight.w500);
            } else {
              return Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: _navigationIconGrayLight, fontWeight: FontWeight.w500);
            }
          }),
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(color: _primaryLightColor);
            } else {
              return const IconThemeData(color: _navigationIconGrayLight);
            }
          }),
          indicatorColor: Colors.transparent,
          backgroundColor: const Color(0xF0F8F9F8),
          surfaceTintColor: Colors.transparent,
          elevation: 50.0),

      /// theme for navigation rail used on web
      navigationRailTheme: NavigationRailThemeData(
        selectedLabelTextStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: _primaryLightColor, fontWeight: FontWeight.w500),
        unselectedLabelTextStyle:
            Theme.of(context).textTheme.labelMedium?.copyWith(
                /*color: _navigationIconGrayLight, */
                fontWeight: FontWeight.w500),
        selectedIconTheme: const IconThemeData(color: _primaryLightColor),
        /*unselectedIconTheme:
            const IconThemeData(color: _navigationIconGrayLight),*/
        //indicatorColor: Colors.transparent,
        useIndicator: false,
        backgroundColor: _lightBackground,
        //surfaceTintColor: Colors.transparent
      ),

      /// style pop up menu
      popupMenuTheme: PopupMenuThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          surfaceTintColor: Colors.transparent),

      /// style snackbar
      snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.redAccent),

      /// style chip
      chipTheme: const ChipThemeData(
          backgroundColor: _darkGray,
          labelStyle: TextStyle(color: Colors.white),
          side: BorderSide.none,
          selectedColor: _primaryLightColor));
}

/// dark theme
ThemeData darkTheme(BuildContext context) {
  return ThemeData(

      /// for dark mode
      brightness: Brightness.dark,

      /// basic color scheme
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
          onSurface: _almostWhite),

      /// ensures Theme.of(context).primaryColor is usable
      primaryColor: _primaryDarkColor,

      /// remove splash effect on e.g. IconButtons
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,

      /// custom elevated button styling
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => _primaryDarkColor),
              foregroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
              shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))))),

      /// remove tint of dialogs
      dialogTheme: const DialogTheme(
          backgroundColor: Color(0xff252525),
          surfaceTintColor: Colors.transparent),

      /// remove tint of sheets
      bottomSheetTheme:
          const BottomSheetThemeData(surfaceTintColor: Colors.transparent),

      /// adjust some text colors
      textTheme: const TextTheme(
          labelLarge: TextStyle(color: _primaryDarkColor),
          titleMedium: TextStyle(color: _primaryDarkColor)),

      /// remove change of color if scrollView is behind
      appBarTheme: const AppBarTheme(
          surfaceTintColor: _darkBackground, backgroundColor: _darkBackground),

      /// remove colored tint and shadow of card, add margin
      cardTheme: CardTheme(
          color: const Color(0xff252525),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          margin: EdgeInsets.symmetric(
              vertical: context.halfPadding, horizontal: context.padding)),

      /// set all title colors of expansion tile to the same color
      expansionTileTheme: const ExpansionTileThemeData(
        collapsedTextColor: _primaryDarkColor,
        collapsedIconColor: _primaryDarkColor,
        textColor: _primaryDarkColor,
        iconColor: _primaryDarkColor,
      ),

      /// use Material 3 Widgets
      useMaterial3: true,

      ///
      dividerColor: Colors.transparent,

      ///
      dividerTheme: const DividerThemeData(color: Color(0xff323234)),

      /// remove indicator and tint, color selected icon + label
      navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: _primaryDarkColor, fontWeight: FontWeight.w500);
            } else {
              return Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: _navigationIconGrayDark, fontWeight: FontWeight.w500);
            }
          }),
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(color: _primaryDarkColor);
            } else {
              return const IconThemeData(color: _navigationIconGrayDark);
            }
          }),
          indicatorColor: Colors.transparent,
          backgroundColor: const Color(0xF01D1D1D),
          surfaceTintColor: Colors.transparent,
          elevation: 50.0),

      /// theme for navigation rail used on web
      navigationRailTheme: NavigationRailThemeData(
        selectedLabelTextStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: _primaryLightColor, fontWeight: FontWeight.w500),
        unselectedLabelTextStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(
                color: _navigationIconGrayLight, fontWeight: FontWeight.w500),
        selectedIconTheme: const IconThemeData(color: _primaryLightColor),
        unselectedIconTheme:
            const IconThemeData(color: _navigationIconGrayLight),
        //indicatorColor: Colors.transparent,
        useIndicator: false,
        backgroundColor: _darkBackground,
        //surfaceTintColor: Colors.transparent
      ),

      /// style pop up menu
      popupMenuTheme: PopupMenuThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          surfaceTintColor: Colors.transparent),

      /// style snackbar
      snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.redAccent),

      /// style chip
      chipTheme: const ChipThemeData(
          backgroundColor: _primaryDarkColor,
          labelStyle: TextStyle(color: Colors.white),
          side: BorderSide.none));
}
