import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/ui/design_tokens.dart';

/// Glassmorphism kart — buzlu cam (BackdropFilter) + ince marka kenarlık +
/// yumuşak gölge. `Card`'ın yerini alan iş gücü bileşeni.
///
/// İsteğe bağlı [glowColor] ile marka parıltısı; [onTap] verilirse basışta
/// hafif ölçek animasyonu uygular.
class GlassCard extends StatefulWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.borderRadius = AppRadii.xl,
    this.onTap,
    this.glowColor,
    this.margin,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final VoidCallback? onTap;
  final Color? glowColor;
  final EdgeInsetsGeometry? margin;

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(widget.borderRadius);
    final glow = widget.glowColor;

    Widget card = ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.glassFill,
            borderRadius: radius,
            border: Border.all(color: AppColors.glassBorder),
          ),
          child: Padding(padding: widget.padding, child: widget.child),
        ),
      ),
    );

    card = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: glow?.withValues(alpha: 0.28) ??
                Colors.black.withValues(alpha: 0.35),
            blurRadius: glow != null ? 28 : 18,
            spreadRadius: glow != null ? 1 : 0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: card,
    );

    if (widget.onTap == null) {
      return Container(margin: widget.margin, child: card);
    }

    return Container(
      margin: widget.margin,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedScale(
          scale: _pressed ? 0.97 : 1.0,
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOutCubic,
          child: card,
        ),
      ),
    );
  }
}
