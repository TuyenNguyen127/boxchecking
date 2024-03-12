import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillAmber => BoxDecoration(
        color: appTheme.amber10001,
      );
  static BoxDecoration get fillAmber100 => BoxDecoration(
        color: appTheme.amber100.withOpacity(0.7),
      );
  static BoxDecoration get fillAmber1001 => BoxDecoration(
        color: appTheme.amber100,
      );
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue10001,
      );
  static BoxDecoration get fillBlue100 => BoxDecoration(
        color: appTheme.blue100,
      );
  static BoxDecoration get fillBlue10002 => BoxDecoration(
        color: appTheme.blue10002,
      );
  static BoxDecoration get fillDeepOrange => BoxDecoration(
        color: appTheme.deepOrange100,
      );
  static BoxDecoration get fillDeepOrangeB => BoxDecoration(
        color: appTheme.deepOrange100B2,
      );
  static BoxDecoration get fillDeeporange50 => BoxDecoration(
        color: appTheme.deepOrange50,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillGreenB => BoxDecoration(
        color: appTheme.green100B2,
      );
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillRedA => BoxDecoration(
        color: appTheme.redA200,
      );
  static BoxDecoration get fillRedA700 => BoxDecoration(
        color: appTheme.redA700,
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: appTheme.black900,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: appTheme.redA200,
        border: Border.all(
          color: appTheme.blueGray50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBluegray100 => BoxDecoration(
        color: appTheme.blueGray100,
        border: Border.all(
          color: appTheme.blueGray100,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBluegray300 => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border(
          top: BorderSide(
            color: appTheme.blueGray300,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray3001 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTheme.blueGray300,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray3002 => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: appTheme.blueGray300,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBluegray50 => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: appTheme.blueGray50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: appTheme.gray100,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray200 => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: appTheme.gray200,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray800 => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: appTheme.gray800,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray8001 => BoxDecoration(
        color: appTheme.redA200,
        border: Border.all(
          color: appTheme.gray800,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get circleBorder23 => BorderRadius.circular(
        23.h,
      );
  static BorderRadius get circleBorder40 => BorderRadius.circular(
        40.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL15 => BorderRadius.vertical(
        top: Radius.circular(15.h),
      );
  static BorderRadius get customBorderTL20 => BorderRadius.vertical(
        top: Radius.circular(20.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
