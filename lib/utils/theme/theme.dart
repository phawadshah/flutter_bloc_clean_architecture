import 'package:flutter/material.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/theme/text_theme.dart';

class KTheme {
  static ThemeData dark = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: KColors.primaryBackground,
      textTheme: KTextTheme.dark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: KColors.primary,
        unselectedItemColor: KColors.primaryText,
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: KColors.primary));
}
