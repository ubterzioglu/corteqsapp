import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/ui/app_gradients.dart';
import '../../core/ui/design_tokens.dart';
import '../../core/ui/motion.dart';

/// Markalı yükleyici — dönen + nabız atan CorteQS gradyan halkası.
/// Standart `CircularProgressIndicator`'ın yerini alır.
class CorteqsLoader extends StatelessWidget {
  const CorteqsLoader({super.key, this.size = 44, this.centered = true});

  final double size;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    Widget ring = SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _RingPainter()),
    );

    if (!kDisableAmbientMotion) {
      ring = ring
          .animate(onPlay: (c) => c.repeat())
          .rotate(duration: 1400.ms, curve: Curves.easeInOut)
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scaleXY(begin: 0.9, end: 1.05, duration: 900.ms);
    }

    return centered ? Center(child: ring) : ring;
  }
}

class _RingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final stroke = size.width * 0.12;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..shader = AppGradients.ring.createShader(rect);

    final center = rect.center;
    final radius = (size.width - stroke) / 2;
    // Açıklık bırakılmış halka (yay) — dönüş hissi versin.
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 1.6,
      false,
      paint,
    );

    // Hafif iç parıltı noktası.
    final dot = Paint()..color = AppColors.purple.withValues(alpha: 0.5);
    canvas.drawCircle(center, radius * 0.18, dot);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
