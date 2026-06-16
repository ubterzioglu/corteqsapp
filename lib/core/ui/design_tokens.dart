import 'package:flutter/material.dart';

/// Tasarım token'ları — CorteQS marka paleti. Tek kaynak: burası.
/// Tema (`app_theme.dart`) ve tüm bileşenler bunlardan türetilir.
///
/// Renkler, renkli/dairesel CorteQS logosundan gelir: koyu-öncelikli,
/// canlı, fütüristik. Arka planlar derin uzay siyahı; vurgular marka renkleri.
class AppColors {
  const AppColors._();

  // --- Arka plan katmanları (koyu-öncelikli) ---
  static const Color spaceBlack = Color(0xFF070B14); // zemin
  static const Color surfaceNavy = Color(0xFF0E1322); // yüzey
  static const Color elevatedSurface = Color(0xFF151C30); // yükseltilmiş kart

  // --- Marka renkleri (logo) ---
  static const Color red = Color(0xFFF45A3D);
  static const Color purple = Color(0xFFB76BFF);
  static const Color blue = Color(0xFF3B82F6);
  static const Color green = Color(0xFF67C24A);
  static const Color yellow = Color(0xFFFFB22E);

  // --- Metin ---
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA1A1AA);
  static const Color textMuted = Color(0xFF6B7280);

  // --- Glassmorphism ---
  static const Color glassFill = Color(0x0FFFFFFF); // beyaz %6
  static const Color glassBorder = Color(0x1FFFFFFF); // beyaz %12

  // --- Semantik (geriye dönük uyum + durum) ---
  /// Eski kod `AppColors.primary`/`secondary` kullanabilir; marka renklerine
  /// bağlanır ki derleme kırılmasın.
  static const Color primary = blue;
  static const Color secondary = red;
  static const Color surface = surfaceNavy;
  static const Color onSurface = textPrimary;
  static const Color error = red;
  static const Color success = green;
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
  static const double xl = 24; // standart kart
  static const double xxl = 32; // hero / büyük kart
  static const double pill = 999;
}
