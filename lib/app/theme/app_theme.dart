import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/compute_luminance.dart';
import 'app_colors.dart';

class AppTheme {
  static const TextTheme textTheme = TextTheme();
  static final defaultTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      toolbarHeight: 60,
      titleTextStyle: textTheme.titleMedium,
      backgroundColor: AppColors.white,
      foregroundColor: computeLuminance(AppColors.white),
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightBlue,
      primary: AppColors.primary,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(textTheme),
    useMaterial3: true,
  );
}
