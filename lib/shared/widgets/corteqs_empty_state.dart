import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/ui/app_gradients.dart';
import '../../core/ui/design_tokens.dart';
import '../../core/ui/motion.dart';
import 'gradient_button.dart';

/// Markalı boş durum — yüzen orb + başlık/alt metin + isteğe bağlı CTA.
/// Hata durumları için de kullanılır (friendly metin).
class CorteqsEmptyState extends StatelessWidget {
  const CorteqsEmptyState({
    super.key,
    required this.title,
    this.message,
    this.icon = Icons.bubble_chart_outlined,
    this.actionLabel,
    this.onAction,
    this.dataKey,
  });

  final String title;
  final String? message;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Key? dataKey;

  @override
  Widget build(BuildContext context) {
    return Center(
      key: dataKey,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (kDisableAmbientMotion)
              _Orb(icon: icon)
            else
              _Orb(icon: icon)
                  .animate(onPlay: (c) => c.repeat(reverse: true))
                  .moveY(
                    begin: -6,
                    end: 6,
                    duration: 2200.ms,
                    curve: Curves.easeInOut,
                  ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (message != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: AppSpacing.lg),
              GradientButton(
                label: actionLabel!,
                onPressed: onAction,
                expand: false,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Orb extends StatelessWidget {
  const _Orb({required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppGradients.a,
        boxShadow: [
          BoxShadow(
            color: AppColors.purple.withValues(alpha: 0.45),
            blurRadius: 32,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(icon, size: 44, color: AppColors.textPrimary),
    );
  }
}
