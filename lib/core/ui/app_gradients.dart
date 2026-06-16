import 'package:flutter/material.dart';

import 'design_tokens.dart';

/// CorteQS marka gradyanları — logonun renkli halkasından türetilir.
/// Hero kartlar, CTA butonlar, aktif nav, yükleme animasyonları için.
class AppGradients {
  const AppGradients._();

  /// A: kırmızı → mor → mavi (birincil CTA / hero)
  static const LinearGradient a = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.red, AppColors.purple, AppColors.blue],
  );

  /// B: mor → mavi → yeşil
  static const LinearGradient b = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.purple, AppColors.blue, AppColors.green],
  );

  /// C: kırmızı → sarı → yeşil (sıcak)
  static const LinearGradient c = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.red, AppColors.yellow, AppColors.green],
  );

  /// D: mavi → mor → kırmızı (ters birincil)
  static const LinearGradient d = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.blue, AppColors.purple, AppColors.red],
  );

  /// E: arka plan katmanları (zemin → yüzey → yükseltilmiş)
  static const LinearGradient e = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.spaceBlack,
      AppColors.surfaceNavy,
      AppColors.elevatedSurface,
    ],
  );

  /// Tüm marka renklerini içeren halka — logo dairesi / loader için.
  static const SweepGradient ring = SweepGradient(
    colors: [
      AppColors.red,
      AppColors.yellow,
      AppColors.green,
      AppColors.blue,
      AppColors.purple,
      AppColors.red,
    ],
  );
}
