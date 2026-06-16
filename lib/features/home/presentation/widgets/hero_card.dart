import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/ui/app_gradients.dart';
import '../../../../core/ui/design_tokens.dart';
import '../../../../core/ui/motion.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/gradient_button.dart';

/// Ana sayfa hero kartı — marka mesajı + dekoratif ağ görseli + CTA'lar
/// (app.md 339). Glassmorphism + gradyan parıltı.
class HeroCard extends StatelessWidget {
  const HeroCard({
    super.key,
    required this.isLoggedIn,
    required this.onPrimaryAction,
    required this.onSecondaryAction,
  });

  final bool isLoggedIn;
  final VoidCallback onPrimaryAction;
  final VoidCallback onSecondaryAction;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return GlassCard(
      key: const Key('home_hero_card'),
      glowColor: AppColors.purple,
      borderRadius: AppRadii.xxl,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: _NetworkOrb()),
          const SizedBox(height: AppSpacing.lg),
          Text('Türk Diasporasının Dijital Evi', style: text.headlineSmall),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Dünyadaki insanları, işletmeleri, toplulukları ve fırsatları '
            'tek bir akıllı ağda keşfet.',
            style: text.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.lg),
          GradientButton(
            label: isLoggedIn ? 'Ağı Keşfet' : 'Giriş Yap',
            icon: Icons.travel_explore,
            onPressed: onPrimaryAction,
          ),
          const SizedBox(height: AppSpacing.sm),
          OutlinedButton.icon(
            onPressed: onSecondaryAction,
            icon: const Icon(Icons.near_me_outlined, size: 18),
            label: const Text('Yakınımdakiler'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
            ),
          ),
        ],
      ),
    );
  }
}

/// Dekoratif bağlantı orbu — dönen marka halkası + yüzen düğümler.
/// Veri gerektirmez; yalnız görsel kimlik (logonun dairesel anlamı).
class _NetworkOrb extends StatelessWidget {
  const _NetworkOrb();

  @override
  Widget build(BuildContext context) {
    Widget ring = SizedBox(
      width: 120,
      height: 120,
      child: CustomPaint(painter: _RingPainter()),
    );
    Widget orb = Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppGradients.a,
        boxShadow: [
          BoxShadow(
            color: AppColors.purple.withValues(alpha: 0.5),
            blurRadius: 24,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Icon(
        Icons.public,
        color: AppColors.textPrimary,
        size: 28,
      ),
    );

    if (!kDisableAmbientMotion) {
      ring = ring.animate(onPlay: (c) => c.repeat()).rotate(duration: 8000.ms);
      orb = orb
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scaleXY(begin: 0.95, end: 1.05, duration: 1800.ms);
    }

    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [ring, orb],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final center = rect.center;
    final radius = size.width / 2 - 4;

    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..shader = AppGradients.ring.createShader(rect);
    canvas.drawCircle(center, radius, ring);

    // Halka üzerinde küçük düğümler (avatar takımyıldızı hissi)
    const count = 5;
    final dotColors = [
      AppColors.red,
      AppColors.yellow,
      AppColors.green,
      AppColors.blue,
      AppColors.purple,
    ];
    for (var i = 0; i < count; i++) {
      final angle = (2 * math.pi / count) * i - math.pi / 2;
      final pos = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      canvas.drawCircle(pos, 5, Paint()..color = dotColors[i]);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
