import 'package:flutter/material.dart';
import 'package:sgm_block/utils/constants/colors.dart';

class KTextTheme {
  static TextStyle _getTextStyle({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w600,
    required Color color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextTheme dark = TextTheme(
    displayLarge: _getTextStyle(
      fontSize: 42,
      color: KColors.secondaryText,
    ),
    displayMedium: _getTextStyle(
      fontSize: 38,
      color: KColors.secondaryText,
    ),
    displaySmall: _getTextStyle(
      fontSize: 34,
      color: KColors.secondaryText,
    ),
    headlineLarge: _getTextStyle(
      fontSize: 32,
      color: KColors.secondaryText,
    ),
    headlineMedium: _getTextStyle(
      fontSize: 28,
      color: KColors.secondaryText,
    ),
    headlineSmall: _getTextStyle(
      fontSize: 26,
      color: KColors.secondaryText,
    ),
    titleLarge: _getTextStyle(
      fontSize: 24,
      color: KColors.secondaryText,
    ),
    titleMedium: _getTextStyle(
      fontSize: 20,
      color: KColors.secondaryText,
    ),
    titleSmall: _getTextStyle(
      fontSize: 18,
      color: KColors.secondaryText,
    ),
    bodyLarge: _getTextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: KColors.primaryText,
    ),
    bodyMedium: _getTextStyle(
      fontSize: 14,
      color: KColors.secondaryText,
    ),
    bodySmall: _getTextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: KColors.primaryText,
    ),
  );
}
