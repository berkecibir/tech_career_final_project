import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: AppBarTheme(
      color: Colors.grey[100],
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: AppColors.black,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
