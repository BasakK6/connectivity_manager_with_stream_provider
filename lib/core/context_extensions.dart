import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQueryData => MediaQuery.of(this);

  ThemeData get themeData => Theme.of(this);
}

extension SizeExtension on BuildContext {
  double get width => mediaQueryData.size.width;

  double get height => mediaQueryData.size.height;

  double dynamicWidth(double percentage) => width * percentage;

  double dynamicHeight(double percentage) => height * percentage;
}

extension ThemeExtension on BuildContext {
  ColorScheme get colorScheme => themeData.colorScheme;
}
