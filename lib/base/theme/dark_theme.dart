import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/theme/constants.dart';
import 'package:flutter/material.dart';

/// dark theme
ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    /// for dark mode
    brightness: Brightness.dark,

    /// basic color scheme
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primaryDarkColor,
      onPrimary: Colors.white,
      secondary: lightGray,
      onSecondary: almostWhite,
      error: Colors.red,
      onError: almostWhite,
      surface: darkBackground,
      onSurface: almostWhite,
    ),

    /// ensures Theme.of(context).primaryColor is usable
    primaryColor: primaryDarkColor,

    /// remove splash effect on e.g. IconButtons
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,

    /// custom elevated button styling
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return darkGray;
          } else {
            return primaryDarkColor;
          }
        }),
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) => Colors.white,
        ),
        shape: WidgetStateProperty.resolveWith(
          (states) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    ),

    /// remove tint of dialogs
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xff252525),
      surfaceTintColor: Colors.transparent,
    ),

    /// remove tint of sheets
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.transparent,
    ),

    /// adjust some text colors
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: primaryDarkColor),
      titleMedium: TextStyle(color: primaryDarkColor),
    ),

    /// remove change of color if scrollView is behind
    appBarTheme: const AppBarTheme(
      surfaceTintColor: darkBackground,
      backgroundColor: darkBackground,
    ),

    /// remove colored tint and shadow of card, add margin
    cardTheme: CardTheme(
      color: const Color(0xff252525),
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      margin: EdgeInsets.symmetric(
        vertical: context.halfPadding,
        horizontal: context.padding,
      ),
    ),

    /// set all title colors of expansion tile to the same color
    expansionTileTheme: const ExpansionTileThemeData(
      collapsedTextColor: primaryDarkColor,
      collapsedIconColor: primaryDarkColor,
      textColor: primaryDarkColor,
      iconColor: primaryDarkColor,
    ),

    /// use Material 3 Widgets
    useMaterial3: true,

    ///
    dividerColor: Colors.transparent,

    ///
    dividerTheme: const DividerThemeData(color: Color(0xff323234)),

    /// remove indicator and tint, color selected icon + label
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Theme.of(context).textTheme.labelSmall?.copyWith(
            color: primaryDarkColor,
            fontWeight: FontWeight.w500,
          );
        } else {
          return Theme.of(context).textTheme.labelSmall?.copyWith(
            color: navigationIconGrayDark,
            fontWeight: FontWeight.w500,
          );
        }
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: primaryDarkColor);
        } else {
          return const IconThemeData(color: navigationIconGrayDark);
        }
      }),
      indicatorColor: Colors.transparent,
      backgroundColor: const Color(0xF01D1D1D),
      surfaceTintColor: Colors.transparent,
      elevation: 50.0,
    ),

    /// theme for navigation rail used on web
    navigationRailTheme: NavigationRailThemeData(
      selectedLabelTextStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: primaryLightColor,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelTextStyle: Theme.of(
        context,
      ).textTheme.labelMedium?.copyWith(
        color: navigationIconGrayLight,
        fontWeight: FontWeight.w500,
      ),
      selectedIconTheme: const IconThemeData(color: primaryLightColor),
      unselectedIconTheme: const IconThemeData(color: navigationIconGrayLight),
      useIndicator: false,
      backgroundColor: darkBackground,
    ),

    /// style pop up menu
    popupMenuTheme: PopupMenuThemeData(
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      surfaceTintColor: Colors.transparent,
    ),

    /// style snackbar
    snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.redAccent),

    /// style chip
    chipTheme: ChipThemeData(
      elevation: 1.5,
      showCheckmark: false,
      labelStyle: const TextStyle(color: Colors.white),
      side: BorderSide.none,
      color: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryDarkColor;
        } else {
          return darkGray;
        }
      }),
    ),

    /// style for segmented button
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          } else {
            return primaryDarkColor;
          }
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryDarkColor;
          } else {
            return Colors.transparent;
          }
        }),
        side: const WidgetStatePropertyAll(
          BorderSide(color: darkGray, width: 0.5),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
      ),
    ),

    /// style for dateTimePicker
    datePickerTheme: const DatePickerThemeData(
      surfaceTintColor: darkBackground,
      backgroundColor: darkBackground,
    ),
  );
}
