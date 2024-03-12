import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lastapp/core/utils/pref_utils.dart';
import 'package:lastapp/core/utils/size_utils.dart';
import 'package:get/get.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray100,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.gray100,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.red100B2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 2,
        space: 2,
        color: appTheme.gray300,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray500,
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.lightBlue800,
          fontSize: 15.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 24.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.blueGray300,
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 20.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: Color(0XFF077D33),
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFFFFFFF),
    primaryContainer: Color(0XFF464C53),

    // Error colors
    errorContainer: Color(0XFF3DA2FF),
    onError: Color(0XFFF0EFEF),
    onErrorContainer: Color(0XFF231F20),

    // On colors(text colors)
    onPrimary: Color(0XFF0D2C7D),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber100 => Color(0XFFFFEDBE);
  Color get amber10001 => Color(0XFFFFECBD);
  Color get amber600 => Color(0XFFFFB700);

  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blue100 => Color(0XFFBEE4FF);
  Color get blue10001 => Color(0XFFCCDAFB);
  Color get blue10002 => Color(0XFFBDE3FF);
  Color get blue500 => Color(0XFF309CFF);
  Color get blueA700 => Color(0XFF0056FF);

  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray10001 => Color(0XFFCECECE);
  Color get blueGray200 => Color(0XFFADB8C4);
  Color get blueGray300 => Color(0XFFA1ADBC);
  Color get blueGray400 => Color(0XFF8D8D8D);
  Color get blueGray50 => Color(0XFFF1F1F1);

  // DeepOrange
  Color get deepOrange100 => Color(0XFFFFC0C0);
  Color get deepOrange50 => Color(0XFFFDDCDC);

  // DeepOrangeB
  Color get deepOrange100B2 => Color(0XB2FFD9BE);

  // Gray
  Color get gray100 => Color(0XFFF6F6F6);
  Color get gray200 => Color(0XFFEAEAEA);
  Color get gray300 => Color(0XFFDDDDDD);
  Color get gray500 => Color(0XFFA8A8A8);
  Color get gray800 => Color(0XFF484848);
  Color get gray80001 => Color(0XFF4D4444);
  Color get gray80002 => Color(0XFF383838);

  // GreenB
  Color get green100B2 => Color(0XB2CEF0C2);

  // Green
  Color get green600 => Color(0XFF3B8D5A);
  Color get green800 => Color(0XFF077D33);
  Color get green80001 => Color(0XFF067C33);
  Color get green80002 => Color(0XFF237A4A);
  Color get greenA700 => Color(0XFF02A04B);

  // Indigo
  Color get indigo600 => Color(0XFF3C569A);

  // LightBlue
  Color get lightBlue800 => Color(0XFF0079BD);
  Color get lightBlueA700 => Color(0XFF0093FF);
  Color get lightBlueA70001 => Color(0XFF0084FF);

  // Orange
  Color get orangeA700 => Color(0XFFFF5B00);
  Color get orangeA70001 => Color(0XFFFF6B00);

  // RedB
  Color get red100B2 => Color(0XB2FCCDCD);

  // Red
  Color get redA200 => Color(0XFFFF4C4C);
  Color get redA700 => Color(0XFFFF0000);

  // Teal
  Color get teal900 => Color(0XFF036731);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
