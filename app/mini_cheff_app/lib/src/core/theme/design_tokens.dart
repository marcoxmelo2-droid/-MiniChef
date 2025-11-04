import 'package:flutter/material.dart';

class NutriMaeTokens {
  NutriMaeTokens._();

  // Colors
  static const Color primary = Color(0xFF6CC24A);
  static const Color secondary = Color(0xFFFFB703);
  static const Color accent = Color(0xFFFF6B6B);
  static const Color background = Color(0xFFFFFFFF);
  static const Color softBackground = Color(0xFFF7FAF7);
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSoft = Color(0xFF6B7280);
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // Dark mode
  static const Color darkBackground = Color(0xFF0B1220);
  static const Color darkCard = Color(0xFF121A2B);
  static const Color darkText = Color(0xFFE5E7EB);
  static const Color primary200 = Color(0xFF93E07A);

  // Typography sizes
  static const double display = 32;
  static const double headline = 24;
  static const double title = 20;
  static const double body = 16;
  static const double caption = 14;

  // Spacing scale
  static const double space4 = 4;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space16 = 16;
  static const double space24 = 24;
  static const double space32 = 32;

  // Radius
  static const double radiusXs = 6;
  static const double radiusSm = 10;
  static const double radiusLg = 16;
  static const double radiusXl = 24;

  // Shadows
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(0, 4),
      blurRadius: 12,
    )
  ];
}
