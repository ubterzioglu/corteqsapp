import 'package:flutter/material.dart';

import '../../core/ui/design_tokens.dart';

/// Ambient marka arka planı — derin uzay siyahı zemin + yumuşak marka renkli
/// radyal parıltı blob'ları. Tüm rotaların arkasına `MaterialApp.builder` ile
/// yerleşir. Performans: tek statik katman, `RepaintBoundary` ile izole;
/// noisy olmaması için düşük opaklık.
class CorteqsBackground extends StatelessWidget {
  const CorteqsBackground({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: DecoratedBox(
        decoration: const BoxDecoration(color: AppColors.spaceBlack),
        child: Stack(
          children: [
            // Sağ üst — kırmızı/mor parıltı
            const Positioned(
              top: -120,
              right: -100,
              child: _GlowBlob(color: AppColors.purple, size: 320, opacity: 0.18),
            ),
            const Positioned(
              top: 40,
              right: -60,
              child: _GlowBlob(color: AppColors.red, size: 220, opacity: 0.14),
            ),
            // Sol alt — mavi/yeşil parıltı
            const Positioned(
              bottom: -140,
              left: -120,
              child: _GlowBlob(color: AppColors.blue, size: 360, opacity: 0.16),
            ),
            const Positioned(
              bottom: 80,
              left: -40,
              child: _GlowBlob(color: AppColors.green, size: 200, opacity: 0.10),
            ),
            ?child,
          ],
        ),
      ),
    );
  }
}

class _GlowBlob extends StatelessWidget {
  const _GlowBlob({
    required this.color,
    required this.size,
    required this.opacity,
  });

  final Color color;
  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: opacity),
              color.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
  }
}
