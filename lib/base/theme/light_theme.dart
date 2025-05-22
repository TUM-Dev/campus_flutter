import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/theme/constants.dart';
import 'package:flutter/material.dart';

/// light theme
ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    /// for light mode
    brightness: Brightness.light,

    /// basic color scheme
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryLightColor,
      onPrimary: Colors.white,
      secondary: darkGray,
      onSecondary: almostBlack,
      error: Colors.red,
      onError: almostBlack,
      surface: lightBackground,
      onSurface: almostBlack,
    ),

    /// ensures Theme.of(context).primaryColor is usable
    primaryColor: primaryLightColor,

    /// remove splash effect on e.g. IconButtons
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,

    /// custom elevated button styling
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(1.5),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return lightGray;
          } else {
            return primaryLightColor;
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
    dialogTheme: const DialogThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
    ),

    /// remove tint of sheets
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.transparent,
    ),

    /// adjust some text colors
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: primaryLightColor),
      titleMedium: TextStyle(color: primaryLightColor),
    ),

    /// remove change of color if scrollView is behind
    appBarTheme: const AppBarTheme(
      surfaceTintColor: lightBackground,
      backgroundColor: lightBackground,
    ),

    /// remove colored tint and shadow of card, add margin
    cardTheme: CardThemeData(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      margin: EdgeInsets.symmetric(
        vertical: context.halfPadding,
        horizontal: context.padding,
      ),
    ),

    /// set all title colors of expansion tile to the same color
    expansionTileTheme: const ExpansionTileThemeData(
      collapsedTextColor: primaryLightColor,
      collapsedIconColor: primaryLightColor,
      textColor: primaryLightColor,
      iconColor: primaryLightColor,
    ),

    /// use material 3 widgets
    useMaterial3: true,

    ///
    dividerColor: Colors.transparent,

    ///
    dividerTheme: const DividerThemeData(color: Color(0xffE3E3E4)),

    /// remove indicator and tint, color selected icon + label
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Theme.of(context).textTheme.labelSmall?.copyWith(
            color: primaryLightColor,
            fontWeight: FontWeight.w500,
          );
        } else {
          return Theme.of(context).textTheme.labelSmall?.copyWith(
            color: navigationIconGrayLight,
            fontWeight: FontWeight.w500,
          );
        }
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: primaryLightColor);
        } else {
          return const IconThemeData(color: navigationIconGrayLight);
        }
      }),
      indicatorColor: Colors.transparent,
      backgroundColor: const Color(0xF0F8F9F8),
      surfaceTintColor: Colors.transparent,
    ),

    /// theme for navigation rail used on web
    navigationRailTheme: NavigationRailThemeData(
      selectedLabelTextStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: primaryLightColor,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelTextStyle: Theme.of(
        context,
      ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
      selectedIconTheme: const IconThemeData(color: primaryLightColor),
      useIndicator: false,
      backgroundColor: lightBackground,
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
          return primaryLightColor;
        } else {
          return lightGray;
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
            return primaryLightColor;
          }
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryLightColor;
          } else {
            return Colors.transparent;
          }
        }),
        side: const WidgetStatePropertyAll(
          BorderSide(color: lightGray, width: 0.5),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
      ),
    ),

    /// style for dateTimePicker
    datePickerTheme: const DatePickerThemeData(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
    ),
  );
}
