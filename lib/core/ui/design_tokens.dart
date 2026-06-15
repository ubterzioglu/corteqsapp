import 'package:flutter/material.dart';

/// Tasarım token'ları — Radix/shadcn/Tailwind yerine merkezi sabitler.
/// Tema (`app_theme.dart`) bunlardan türetilir. Tek kaynak: burası.
class AppColors {
  const AppColors._();

  // Marka renkleri (placeholder — gerçek marka paleti tasarımcı ile netleşecek).
  static const Color primary = Color(0xFF1E5AA8);
  static const Color primaryDark = Color(0xFF14407A);
  static const Color secondary = Color(0xFFE94F37);
  static const Color surface = Color(0xFFFAFAFA);
  static const Color onSurface = Color(0xFF1A1A1A);
  static const Color error = Color(0xFFB00020);
  static const Color success = Color(0xFF2E7D32);
}

class AppSpacing {
  const AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

class AppRadii {
  const AppRadii._();

  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double pill = 999;
}
