import 'package:flutter/material.dart';

import '../../../../core/ui/app_gradients.dart';
import '../../../../core/ui/design_tokens.dart';
import '../../../../shared/widgets/avatar_ring.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../domain/profile_view_model.dart';

/// Profil özet başlığı (app.md 377): gradyan banner + gradyan halkalı avatar,
/// ad/rol, tamamlanma %, sayaç kartları.
class ProfileSummaryHeader extends StatelessWidget {
  const ProfileSummaryHeader({super.key, required this.model});

  final SelfProfileViewModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pct = model.completionPercentage.clamp(0, 100);

    return GlassCard(
      key: const Key('profile_summary_card'),
      padding: EdgeInsets.zero,
      borderRadius: AppRadii.xxl,
      glowColor: AppColors.purple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Marka gradyan banner
          Container(
            height: 84,
            decoration: const BoxDecoration(
              gradient: AppGradients.d,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppRadii.xxl),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(AppSpacing.md, -32),
            child: AvatarRing(
              initial: model.displayName,
              size: 72,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              0,
              AppSpacing.md,
              AppSpacing.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.displayName, style: theme.textTheme.titleLarge),
                if (model.roleLabel.isNotEmpty)
                  Text(model.roleLabel, style: theme.textTheme.bodyMedium),
                if (model.email != null)
                  Text(model.email!, style: theme.textTheme.bodySmall),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Profil tamamlanma: %$pct',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.xs),
                _GradientProgress(value: pct / 100),
                const SizedBox(height: AppSpacing.md),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    _StatChip(
                      label: 'Public alan',
                      value: model.publicAttributeCount,
                      color: AppColors.blue,
                    ),
                    _StatChip(
                      label: 'Bekleyen talep',
                      value: model.pendingCount,
                      color: AppColors.yellow,
                    ),
                    _StatChip(
                      label: 'Açık dashboard',
                      value: model.dashboardCount,
                      color: AppColors.green,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GradientProgress extends StatelessWidget {
  const _GradientProgress({required this.value});
  final double value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadii.pill),
      child: Stack(
        children: [
          Container(height: 8, color: AppColors.glassFill),
          FractionallySizedBox(
            widthFactor: value.clamp(0.0, 1.0),
            child: Container(
              height: 8,
              decoration: const BoxDecoration(gradient: AppGradients.a),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.label,
    required this.value,
    required this.color,
  });
  final String label;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$value',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(width: 6),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
