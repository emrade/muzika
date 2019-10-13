import 'package:flutter/material.dart';
import 'utils/colors.dart';

ThemeData buildThemeData() {
  final baseTheme = ThemeData();

  return baseTheme.copyWith(
    primaryColor: CustomColors.primaryColor,
    scaffoldBackgroundColor: CustomColors.scaffoldColor,
    appBarTheme: AppBarTheme(
      color: CustomColors.appBarColor,
      elevation: 0,
    ),
  );
}
