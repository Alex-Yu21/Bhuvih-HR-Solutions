import 'package:flutter/material.dart';

import 'app_colors.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    primaryContainer: AppColors.primaryContainer,
    error: Colors.red,
    onError: Colors.white,
    surface: AppColors.background,
    onSurface: AppColors.textPrimary,
  ),
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.onPrimary,
    elevation: 6,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
);
