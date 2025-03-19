import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension Extensions on BuildContext {
  TextTheme get _textTheme => Theme.of(this).textTheme;
  GoRouter get router => GoRouter.of(this);

  TextStyle get displayLarge => _textTheme.displayLarge!;
  TextStyle get displayMedium => _textTheme.displayMedium!;
  TextStyle get displaySmall => _textTheme.displaySmall!;

  TextStyle get headlineLarge => _textTheme.headlineLarge!;
  TextStyle get headlineMedium => _textTheme.headlineMedium!;
  TextStyle get headlineSmall => _textTheme.headlineSmall!;

  TextStyle get titleLarge => _textTheme.titleLarge!;
  TextStyle get titleMedium => _textTheme.titleMedium!;
  TextStyle get titleSmall => _textTheme.titleSmall!;

  TextStyle get bodyLarge => _textTheme.bodyLarge!;
  TextStyle get bodyMedium => _textTheme.bodyMedium!;
  TextStyle get bodySmall => _textTheme.bodySmall!;
}

extension SpaceExtension on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}
