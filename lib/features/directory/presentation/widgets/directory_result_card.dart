import 'package:flutter/material.dart';

import '../../../../core/ui/design_tokens.dart';
import '../../../../shared/widgets/avatar_ring.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../domain/directory_models.dart';

/// Dizin sonuç kartı (app.md 363). Gradyan halkalı avatar + başlık + rol +
/// konum pill + doğrulama/öne çıkan rozetler. Cam kart.
class DirectoryResultCard extends StatelessWidget {
  const DirectoryResultCard({
    super.key,
    required this.row,
    required this.onTap,
  });

  final DirectoryRow row;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final location = [row.city, row.country]
        .where((e) => e != null && e.isNotEmpty)
        .join(', ');

    return GlassCard(
      onTap: onTap,
      borderRadius: AppRadii.xl,
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      glowColor: row.isFeatured ? AppColors.yellow : null,
      child: Row(
        children: [
          AvatarRing(
            imageUrl: row.imageUrl,
            initial: row.title,
            online: row.isVerified,
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        row.title,
                        overflow: TextOverflow.ellipsis,
                        style: text.titleMedium,
                      ),
                    ),
                    if (row.isVerified)
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.verified_rounded,
                          size: 16,
                          color: AppColors.blue,
                        ),
                      ),
                    if (row.isFeatured)
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: AppColors.yellow,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(row.roleLabel, style: text.bodySmall),
                if (location.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.sm),
                  _LocationPill(location: location),
                ],
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 20,
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }
}

class _LocationPill extends StatelessWidget {
  const _LocationPill({required this.location});
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.glassFill,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.place_outlined,
            size: 12,
            color: AppColors.textSecondary,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              location,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
