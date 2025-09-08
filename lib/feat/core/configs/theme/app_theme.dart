import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: Color(0xFF1E293B), // CustomAppBar'daki default title color
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF64748B), // CustomAppBar'daki icon color
        size: 18,
      ),
      // Back button için özel styling
      actionsIconTheme: const IconThemeData(color: Color(0xFF64748B), size: 20),
      // Status bar style
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    // Gradient AppBar'lar için özel tema
    extensions: <ThemeExtension<dynamic>>[
      CustomAppBarTheme(
        gradientColors: const [Color(0xFF667EEA), Color(0xFF764BA2)],
        transparentBackgroundColor: const Color.fromRGBO(255, 255, 255, 0.15),
        transparentBorderColor: const Color.fromRGBO(255, 255, 255, 0.2),
        defaultBackgroundColor: const Color(0xFFF8FAFC),
        defaultBorderColor: const Color(0xFFE2E8F0),
      ),
    ],
  );
}

// CustomAppBar için özel tema extension'ı
class CustomAppBarTheme extends ThemeExtension<CustomAppBarTheme> {
  final List<Color> gradientColors;
  final Color transparentBackgroundColor;
  final Color transparentBorderColor;
  final Color defaultBackgroundColor;
  final Color defaultBorderColor;

  const CustomAppBarTheme({
    required this.gradientColors,
    required this.transparentBackgroundColor,
    required this.transparentBorderColor,
    required this.defaultBackgroundColor,
    required this.defaultBorderColor,
  });

  @override
  CustomAppBarTheme copyWith({
    List<Color>? gradientColors,
    Color? transparentBackgroundColor,
    Color? transparentBorderColor,
    Color? defaultBackgroundColor,
    Color? defaultBorderColor,
  }) {
    return CustomAppBarTheme(
      gradientColors: gradientColors ?? this.gradientColors,
      transparentBackgroundColor:
          transparentBackgroundColor ?? this.transparentBackgroundColor,
      transparentBorderColor:
          transparentBorderColor ?? this.transparentBorderColor,
      defaultBackgroundColor:
          defaultBackgroundColor ?? this.defaultBackgroundColor,
      defaultBorderColor: defaultBorderColor ?? this.defaultBorderColor,
    );
  }

  @override
  CustomAppBarTheme lerp(ThemeExtension<CustomAppBarTheme>? other, double t) {
    if (other is! CustomAppBarTheme) {
      return this;
    }
    return CustomAppBarTheme(
      gradientColors: gradientColors,
      transparentBackgroundColor: Color.lerp(
        transparentBackgroundColor,
        other.transparentBackgroundColor,
        t,
      )!,
      transparentBorderColor: Color.lerp(
        transparentBorderColor,
        other.transparentBorderColor,
        t,
      )!,
      defaultBackgroundColor: Color.lerp(
        defaultBackgroundColor,
        other.defaultBackgroundColor,
        t,
      )!,
      defaultBorderColor: Color.lerp(
        defaultBorderColor,
        other.defaultBorderColor,
        t,
      )!,
    );
  }
}
