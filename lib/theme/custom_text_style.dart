import 'package:flutter/material.dart';
import 'package:lastapp/core/utils/size_utils.dart';
import 'package:lastapp/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );
  static get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 10.fSize,
      );
  static get bodySmall11 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 11.fSize,
      );
  static get bodySmallBlue500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blue500,
        fontSize: 10.fSize,
      );
  static get bodySmallErrorContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 10.fSize,
      );
  static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallffff4040 => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFFFF4040),
      );
  // Label text style
  static get labelLargeBlueA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueA700,
      );
  static get labelLargeBluegray300 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray300,
      );
  static get labelLargeBluegray400 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray400,
      );
  static get labelLargeGray0xFFA2AEBC => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray0xFFA2AEBC,
      );
  static get labelLargeBold => theme.textTheme.labelLarge!.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeGray80002 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray80002,
      );
  static get labelLargeGreen600 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.green600,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeGreen80001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.green80001,
      );
  static get labelLargeLightblue800 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.lightBlue800,
      );
  static get labelLargeLightblueA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.lightBlueA700,
      );
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeOrangeA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.orangeA700,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelLargePrimary13 => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 13.fSize,
      );
  static get labelLargePrimaryContainer => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get labelLargeTeal900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.teal900,
      );
  static get labelMediumBlack900 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumRedA200 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.redA200,
      );
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeBlack900SemiBold => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeBlack900_1 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
      );
  static get titleLargeGray800 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBlack900Medium => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBlack900_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumBluegray300 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray300,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumGray80001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray80001,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumGray80001_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray80001,
      );
  static get titleMediumGreen80002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.green80002,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumRedA200 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA200,
      );
  static get titleMediumRedA200Medium => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA200,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBlack900Medium => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGreen800 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.green800,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGreen800_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.green800,
      );
  static get titleSmallLightblueA70001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.lightBlueA70001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallff000000 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF000000),
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallff9c9c9c => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF9C9C9C),
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
