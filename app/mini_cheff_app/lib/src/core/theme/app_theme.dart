import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_cheff/src/core/theme/design_tokens.dart';

final appThemeProvider = Provider<AppTheme>((ref) {
  return AppTheme();
});

class AppTheme {
  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: NutriMaeTokens.primary,
          brightness: Brightness.light,
          primary: NutriMaeTokens.primary,
          secondary: NutriMaeTokens.secondary,
          error: NutriMaeTokens.error,
        ),
        scaffoldBackgroundColor: NutriMaeTokens.softBackground,
        textTheme: _textTheme(Brightness.light),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: NutriMaeTokens.textPrimary,
          elevation: 0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: NutriMaeTokens.primary,
          foregroundColor: Colors.white,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 0,
          margin: const EdgeInsets.all(NutriMaeTokens.space16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(NutriMaeTokens.radiusLg),
          ),
          shadowColor: Colors.black12,
        ),
      );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: NutriMaeTokens.primary,
          brightness: Brightness.dark,
          primary: NutriMaeTokens.primary200,
          secondary: NutriMaeTokens.secondary,
          error: NutriMaeTokens.error,
        ),
        scaffoldBackgroundColor: NutriMaeTokens.darkBackground,
        cardColor: NutriMaeTokens.darkCard,
        textTheme: _textTheme(Brightness.dark),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: NutriMaeTokens.primary200,
          foregroundColor: Colors.black,
        ),
      );

  TextTheme _textTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final color = isDark ? NutriMaeTokens.darkText : NutriMaeTokens.textPrimary;

    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontSize: NutriMaeTokens.display,
        color: color,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: NutriMaeTokens.headline,
        color: color,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: NutriMaeTokens.title,
        color: color,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: NutriMaeTokens.body,
        color: color,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: NutriMaeTokens.caption,
        color: isDark ? NutriMaeTokens.darkText : NutriMaeTokens.textSoft,
      ),
    );
  }
}
