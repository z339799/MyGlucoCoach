import 'package:flutter/material.dart';
import 'package:pfeproject/core/theme/appColors.dart';
import 'package:pfeproject/core/theme/appFonts.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        titleTextStyle: TextStyle(color: AppColors.primary),
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      textTheme: AppFonts.lightThemeText,
      listTileTheme: const ListTileThemeData().copyWith(
          titleTextStyle: AppFonts.lightThemeText.titleSmall,
          subtitleTextStyle: AppFonts.lightThemeText.bodyLarge),
      colorScheme: AppColors.lightColorScheme,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.secondary,
          maximumSize: const Size.fromWidth(300),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
        ),
      ),

      );
}
