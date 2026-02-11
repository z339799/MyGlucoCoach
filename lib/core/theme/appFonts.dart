import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfeproject/core/theme/appColors.dart';

/// | NAME             | SIZE |  WEIGHT |  SPACING |             |
/// |-----------------|------|---------|----------|-------------|
/// | displayLarge   | 96.0 | light   | -1.5     |             |
/// | displayMedium  | 60.0 | light   | -0.5     |             |
/// | displaySmall   | 48.0 | regular |  0.0     |             |
/// | headlineMedium | 34.0 | regular |  0.25    |             |
/// | headlineSmall | 24.0 | regular |  0.0     |             |
/// | titleLarge    | 20.0 | medium  |  0.15    |             |
/// | titleMedium   | 16.0 | regular |  0.15    |             |
/// | titleSmall    | 14.0 | medium  |  0.1     |             |
/// | bodyLarge     | 16.0 | regular |  0.5     | (bodyText1) |
/// | bodyMedium    | 14.0 | regular |  0.25    | (bodyText2) |
/// | bodySmall     | 14.0 | medium  |  1.25    |             |
/// | labelLarge    | 12.0 | regular |  0.4     |             |
/// | labelSmall    | 10.0 | regular |  1.5     |             |

class AppFonts {
  static TextTheme get _fontTextTheme => GoogleFonts.cairoTextTheme();

  static final _blackheadlineLarge = _fontTextTheme.headlineLarge?.copyWith(
    fontSize: 28,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
  static final _blackheadlineMeduim = _fontTextTheme.headlineMedium?.copyWith(
    fontSize: 24,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );
  static final _blackheadlineSmall = _fontTextTheme.headlineSmall?.copyWith(
    fontSize: 20,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );

  static final _blacktitleLarge = _fontTextTheme.titleLarge?.copyWith(
    fontSize: 18,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );
  static final _blacktitleMedium = _fontTextTheme.titleMedium?.copyWith(
    fontSize: 18,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );
  static final _blacktitleSmall = _fontTextTheme.titleSmall?.copyWith(
    fontSize: 16,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );

  static final _blackbodyMedium = _fontTextTheme.bodyMedium?.copyWith(
    fontSize: 14,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );
  static final _blackbodySmall = _fontTextTheme.bodySmall?.copyWith(
    fontSize: 14,
    color: AppColors.primary,
  );
  static final _blacklabelLarge = _fontTextTheme.labelLarge?.copyWith(
    fontSize: 12,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );

  static get lightThemeText => TextTheme(
        headlineLarge: _blackheadlineLarge,
        headlineMedium: _blackheadlineMeduim,
        headlineSmall: _blackheadlineSmall,
        titleLarge: _blacktitleLarge,
        titleMedium: _blacktitleMedium,
        titleSmall: _blacktitleSmall,
        bodyMedium: _blackbodyMedium,
        bodySmall: _blackbodySmall,
        labelLarge: _blacklabelLarge,
      );
}
