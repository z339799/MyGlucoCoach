import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primary = Color.fromARGB(255, 19, 19, 19);
  static const secondary = Color(0xffFCB01E);
  static const background = Color(0xffFFFFFF);
  static const grey = Color(0xffB6C4C1);
  static const blue = Color(0xffDBEFEC);

  static ColorScheme lightColorScheme = const ColorScheme.light(
    primary: primary,
    secondary: secondary,
    surface: background,
    tertiary: grey,
    onSurface: blue
  );
}
